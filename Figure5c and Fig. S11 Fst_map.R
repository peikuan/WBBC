setwd('F:/res_data_plot')
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
library(devtools)

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

mydata <- read.csv("./input/Five_vs_Han27.csv") 
china_data <- join(china_map_data, mydata, type="full")


cbPalette <- c("#C48888", "#B9B973", "#d0d0d0","#81C0C0", "#A6A6D2")
p <- ggplot(china_data, aes(x = long, y = lat, group = group, fill = location)) +
  scale_fill_manual(values=cbPalette) +
  geom_polygon(colour="grey40") +
  coord_map("polyconic") +
  theme(
    panel.grid = element_blank(),
    panel.background = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    legend.position = c(0.2,0.25)
  )
p

ggsave(file="China_Regions.svg", plot=p)

p2<-ggplot()+
  geom_polygon(data=china_data, aes(x=long,y=lat,group=group, fill = location),color="grey40")+ 
  geom_line(data=l9,aes(x=long,y=lat,group=group),color="grey40",size=0.5)+ 
  scale_fill_manual(values=cbPalette) +
  coord_cartesian(xlim=c(105,125),ylim=c(3,25))+ 
  theme(
    aspect.ratio = 1.35, 
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    panel.background = element_blank(),
    panel.border = element_rect(fill=NA,color="grey20",linetype=1,size=2),
    plot.margin=unit(c(0,0,0,0),"mm"))
p2

ggsave(file="nine_line.svg", plot=p2)


#----------------------------------------------------------------------------------------------


mydata <- read.csv("./input/Five_vs_Han27.csv") 
china_data <- join(china_map_data, mydata, type="full")


p <- ggplot(china_data, aes(x = long, y = lat, group = group, fill = EUR_fst)) +
  geom_polygon(colour="#616130",size=0) +
    scale_fill_gradientn(colors = colorRampPalette(brewer.pal(11,"Spectral")[2:6])(50)) +
  coord_map("polyconic") +
    annotate("text",  x=Inf, y = Inf, label = "EUR vs. China", vjust=5, hjust=4.15, size=5) +
  theme(
    panel.grid = element_blank(),
    panel.background = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    legend.position = c(0.95,0.55),
    legend.key.size=unit(2,'cm'),
    legend.key.width=unit(0.5,'cm'),
  )
p
ggsave(file="./input/AFR_vs_China_FstMap.svg", plot=p)







