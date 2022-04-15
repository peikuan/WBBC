#scatter
library(ggplot2)
library(RColorBrewer)
data<-read.table('./input/ancientdis',sep='\t',header=TRUE)
col <- colorRampPalette(brewer.pal(9,'Set1'))(9)
p<-ggplot(data,aes(x=distance,y=Fst,color=Population))+
    geom_point(shape=16,size=4)+
    scale_colour_manual(values=c('Modern'=col[2],'Ancient'=col[4]),name="")+
    scale_x_continuous(breaks=seq(0,4500,1000),limits=c(0,4500))+
    scale_y_continuous(breaks=seq(0,0.26,0.05))+
    xlab("Geographic distance (km)")+ylab("Pairwise Fst")+
    theme_bw()+
    theme(plot.title = element_text(hjust = 0.5,size=24,face="bold"),
    axis.ticks.length=unit(5,"pt"),
    axis.text.x=element_text(size=16),
    axis.title.x=element_text(size=20),
    axis.text.y=element_text(size=16),
    axis.title.y=element_text(size=20),
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(colour = "black"),
    legend.text=element_text(size=18),
    legend.title=element_blank(),
    legend.position=c(0.1,0.9))

plot(p)
    
ggsave(file="ancientdis.svg",plot=p)

