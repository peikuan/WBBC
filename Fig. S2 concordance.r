library("ggplot2")
library(RColorBrewer)
datahd<-read.table('./input/Heterozygote_Discordance',sep='\t',header=TRUE)
col <- colorRampPalette(brewer.pal(9,'Set1'))(9)

p1<-ggplot(datahd,aes(x=depth,y=Heterozygote_Discordance,colour=Class))+geom_point(size=2)+
      scale_colour_manual(values=c('Pre-genotype refinement'=col[2],'Post-genotype refinement'=col[4]),name="")+
      scale_x_continuous(breaks=seq(10,55,5),limits=c(10,60))+
      scale_y_continuous(breaks=seq(0,0.16,0.02))+
      xlab("Average Sequencing Depth")+ylab("Heterozygote Discordance")+
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
      legend.text=element_text(size=16),
      legend.title=element_blank(),
      legend.position=c(0.6,0.8))


ggsave(file="Heterozygote_Discordance.svg",plot=p1)


library("ggplot2")
datangc<-read.table('./input/Non_ref_Genotype_Concordance',sep='\t',header=TRUE)
p2<-ggplot(datangc,aes(x=depth,y=Non_ref_Genotype_Concordance,colour=Class))+geom_point(size=2)+
      scale_colour_manual(values=c('Pre-genotype refinement'=col[2],'Post-genotype refinement'=col[4]),name="")+
      scale_x_continuous(breaks=seq(10,55,5),limits=c(10,60))+
      scale_y_continuous(breaks=seq(0.90,1,0.01))+
      xlab("Average Sequencing Depth")+ylab("Non-ref Genotype Concordance")+
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
      legend.text=element_text(size=16),
      legend.title=element_blank(),
      legend.position=c(0.6,0.3))


ggsave(file="Non_ref_Genotype_Concordance.svg",plot=p2)



library("ggplot2")
datans<-read.table('./input/Non_ref_Sensitivity',sep='\t',header=TRUE)
p3<-ggplot(datans,aes(x=depth,y=Non_ref_Sensitivity,colour=Class))+geom_point(size=2)+
      scale_colour_manual(values=c('Pre-genotype refinement'=col[2],'Post-genotype refinement'=col[4]),name="")+
      scale_x_continuous(breaks=seq(10,55,5),limits=c(10,60))+
      scale_y_continuous(breaks=seq(0.90,1,0.01))+
      xlab("Average Sequencing Depth")+ylab("Non-ref Sensitivity")+
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
      legend.text=element_text(size=16),
      legend.title=element_blank(),
      legend.position=c(0.6,0.3))


ggsave(file="Non_ref_Sensitivity.svg",plot=p3)


library("ggplot2")
datas<-read.table('./input/Specificity',sep='\t',header=TRUE)

p4<-ggplot(datas,aes(x=depth,y=Specificity,colour=Class))+geom_point(size=2)+
      scale_colour_manual(values=c('Pre-genotype refinement'=col[2],'Post-genotype refinement'=col[4]),name="")+
      scale_x_continuous(breaks=seq(10,55,5),limits=c(10,60))+
      scale_y_continuous(breaks=seq(0.99,1,0.001))+
      xlab("Average Sequencing Depth")+ylab("Specificity")+
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
      legend.text=element_text(size=16),
      legend.title=element_blank(),
      legend.position=c(0.6,0.3))


ggsave(file="Specificity.svg",plot=p4)


library("ggplot2")
datas<-read.table('./input/homozygote_Genotype_Concordance',sep='\t',header=TRUE)

p5<-ggplot(datas,aes(x=depth,y=homozygote_Genotype_Concordance,colour=Class))+geom_point(size=2)+
      scale_colour_manual(values=c('Pre-genotype refinement'=col[2],'Post-genotype refinement'=col[4]),name="")+
      scale_x_continuous(breaks=seq(10,55,5),limits=c(10,60))+
      scale_y_continuous(breaks=seq(0.99,1,0.001))+
      xlab("Average Sequencing Depth")+ylab("Homozygote Genotype Concordance")+
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
      legend.text=element_text(size=16),
      legend.title=element_blank(),
      legend.position=c(0.6,0.3))


ggsave(file="homozygote_Genotype_Concordance.svg",plot=p5)


