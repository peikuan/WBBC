library(mapdata)
library(maps)
library(sp)
library(maptools)
library(ggplot2)
library(plyr)
library(mapproj)
library(RColorBrewer)
library(rgdal)
library(grid)
library(magrittr)
library(dplyr)
library(scatterpie)

l9<-rgdal::readOGR("./input/nine.shp")


map("china")
china_map = readShapePoly("./input/bou2_4p.shp") 

ggplot(china_map,aes(x=long,y=lat,group=group)) +
  geom_polygon(fill="white",colour="grey") +
  coord_map("polyconic")

x <- china_map@data
xs <- data.frame(x,id=seq(0:924)-1)
xs$NAME <- iconv(xs$NAME, "GBK", "UTF-8")

china_map1 <- fortify(china_map)
china_map_data <- join(china_map1, xs, type = "full")

mydata <- read.table("./input/China_location.tsv", sep='\t',header=T) 
china_data <- join(china_map_data, mydata, type="full")


mydatacenter<-read.table("input/prov_centroids.csv", sep='\t',header=T)
mydatamerge<-merge(mydatacenter,mydata,by="NAME")

rhg_cols1<-c("#BE514A","#4A7AB7")
p1<-
ggplot(china_data, aes(x = long, y = lat, group = group)) +
  geom_polygon(colour="grey40",size=0.05,fill="#FAFAFA") +
  geom_scatterpie(data = mydatamerge,
                  aes(x = x, y = y, group = NAME, r = radius/2), 
                 cols=names(mydatamerge)[6:7],color =NA, alpha = 0.8)+
  scale_fill_manual(values=rhg_cols1,name="Type",
                         breaks=c("WGS", "CHIP"),
                         labels=c("WGS", "SNP Array"))+
  geom_scatterpie_legend(mydatamerge$radius/2, x = 85, y = 16)+
  coord_map("polyconic") +
  coord_equal()+
  theme(
    panel.grid = element_blank(),
    panel.background = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    legend.position = c(0.85,0.6)
  )

ggsave(file="China_Regions.svg", plot=p1)

p2<-ggplot()+
  geom_polygon(data=./input/china_data, aes(x=long,y=lat,group=group),fill="#FAFAFA",color="grey40",size=0.05)+ 
  geom_line(data=l9,aes(x=long,y=lat,group=group),color="grey40",size=0.1)+ 
  coord_cartesian(xlim=c(105,125),ylim=c(3,25))+ 
  theme(
    aspect.ratio = 1.35, 
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    panel.background = element_blank(),
    panel.border = element_rect(fill=NA,color="grey20",linetype=1,size=0.1),
    plot.margin=unit(c(0,0,0,0),"mm"))
p2

ggsave(file="nine_line.svg", plot=p2)

