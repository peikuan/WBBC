#scatter
library(ggplot2)
data<-read.table('./input/depth.txt',sep='\t',header=TRUE)

pp<-ggplot(data,aes(x=Sample,y=MeanDepth))+
   geom_point(colour="skyblue",size=2,shape=1)+
   geom_hline(yintercept = 13.9,linetype=5,colour="red")+
   scale_x_continuous(breaks=seq(0,4540,500))+
   scale_y_continuous(breaks=seq(0,70,10),limits=c(0,70))+
   xlab("Samples")+ylab("Sequencing Depth(X)")+
       theme_bw()+
      theme(plot.title = element_text(hjust = 0.5,size=24,face="bold"),
      axis.ticks.length=unit(7,"pt"),
      axis.text.x=element_text(size=22),
      axis.title.x=element_text(size=26),
      axis.text.y=element_text(size=22),
      axis.title.y=element_text(size=26),
      panel.border = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      axis.line = element_line(colour = "black"))

ggsave(file="scatter.svg", width=12, height=8,plot=pp)


#density
library(ggplot2)
theme_set(theme_bw())
data<-read.table('./input/depth.txt',sep='\t',header=TRUE)
pp2<-ggplot(data,aes(x=MeanDepth))+
   geom_density(fill = "skyblue", alpha = 0.6)+
   geom_vline(xintercept = 13.9,linetype=5,colour="red")+
   scale_x_continuous(breaks=seq(5,70,5))+
   scale_y_continuous(breaks=seq(0,0.25,0.05))+
   xlab("Sequencing Depth(X)")+ylab("Density")+
       theme_bw()+
      theme(plot.title = element_text(hjust = 0.5,size=24,face="bold"),
      axis.ticks.length=unit(5,"pt"),
      axis.text.x=element_text(size=14),
      axis.title.x=element_text(size=18),
      axis.text.y=element_text(size=14),
      axis.title.y=element_text(size=18),
      panel.border = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      axis.line = element_line(colour = "black"))
ggsave(file="density.svg", width=12, height=8,plot=pp2)
