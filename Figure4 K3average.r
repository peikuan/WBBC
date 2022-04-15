library("ggplot2")
library(scales)
data<-read.table('./input/K3average',sep='\t',header=TRUE)
cbPalette <- c( "#CC9900","#BE514A", "#4A7AB7")
p1<-ggplot(data,aes(y=Score,x=Provinces,fill=K))+
       geom_bar(stat="identity")+
       scale_fill_manual(values=cbPalette)+
       scale_x_discrete(limits=c('Shanxi','Shandong','Qinghai','Liaoning','Hebei','Gansu','InnerMongolia','Heilongjiang','Jilin','Ningxia','Tianjin','Henan','Shaanxi','Anhui','Jiangsu','Yunnan','Hubei','Zhejiang','Sichuan','Chongqing','Guizhou','Fujian','Jiangxi','Hunan','Guangdong','Guangxi','Hainan'))+
       scale_y_continuous(label = comma,breaks=seq(0,1,0.2))+
       xlab("Provinces")+ylab("Mixture Proportions")+
       theme_bw() +


       theme(panel.border = element_blank(),panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"),
      axis.ticks.length=unit(7,"pt"),
      axis.text.x=element_text(size=20,angle=45, hjust=1),
      axis.title.x=element_text(size=24),
      axis.text.y=element_text(size=18),
      axis.title.y=element_text(size=24))


ggsave(file="K3average.svg", width=12, height=5,plot=p1)





#north
library("ggplot2")
library(scales)
data<-read.table('./input/K3pie',sep='\t',header=TRUE)

cbPalette <- c("#CC9900","#BE514A", "#4A7AB7")
p1<-ggplot(data,aes(y=north,x="",fill=KK))+
    geom_bar(stat="identity",width=1)+
    coord_polar(theta="y",direction=1)+
    scale_fill_manual(values=cbPalette)+
    theme_bw() +


    theme(legend.title=element_blank(),
    legend.position = "none",
    panel.border = element_blank(),panel.grid.major = element_blank(),panel.grid.minor = element_blank())


ggsave(file="north.svg",plot=p1)



#central
library("ggplot2")
library(scales)
data<-read.table('./input/K3pie',sep='\t',header=TRUE)

cbPalette <- c("#CC9900","#BE514A", "#4A7AB7")
p1<-ggplot(data,aes(y=central,x="",fill=KK))+
    geom_bar(stat="identity",width=1)+
    coord_polar(theta="y",direction=1)+
    scale_fill_manual(values=cbPalette)+
    theme_bw() +


    theme(legend.title=element_blank(),
    legend.position = "none",
    panel.border = element_blank(),panel.grid.major = element_blank(),panel.grid.minor = element_blank())


ggsave(file="central.svg",plot=p1)




#south
library("ggplot2")
library(scales)
data<-read.table('K3pie',sep='\t',header=TRUE)

cbPalette <- c("#CC9900","#BE514A", "#4A7AB7")
p1<-ggplot(data,aes(y=south,x="",fill=KK))+
    geom_bar(stat="identity",width=1)+
    coord_polar(theta="y",direction=1)+
    scale_fill_manual(values=cbPalette)+
    theme_bw() +


    theme(legend.title=element_blank(),
    legend.position = "none",
    panel.border = element_blank(),panel.grid.major = element_blank(),panel.grid.minor = element_blank())


ggsave(file="south.svg",plot=p1)



#lingnan
library("ggplot2")
library(scales)
data<-read.table('K3pie',sep='\t',header=TRUE)

cbPalette <- c("#CC9900","#BE514A", "#4A7AB7")
p1<-ggplot(data,aes(y=lingnan,x="",fill=KK))+
    geom_bar(stat="identity",width=1)+
    coord_polar(theta="y",direction=1)+
    scale_fill_manual(values=cbPalette)+
    theme_bw() +


    theme(legend.title=element_blank(),
    legend.position = "none",
    panel.border = element_blank(),panel.grid.major = element_blank(),panel.grid.minor = element_blank())


ggsave(file="lingnan.svg",plot=p1)








