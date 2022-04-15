library("ggplot2")
library(scales)
data<-read.table('./input/AF',sep='\t',header=TRUE)

pp<-ggplot(data,aes(x=AF,y=Frequency))+
       geom_bar(aes(fill=Type),stat="identity")+
       scale_fill_manual(values=c('SNP'="#4A7AB7",'INDEL'="#BE514A"),name="Type")+
       scale_x_discrete(limits=c("AC=1","AC=2","0.005","0.05",">0.05"))+
       scale_y_continuous(label = comma,breaks=seq(0,50,10))+
       xlab("Allele Frequency (AF)")+ylab("Number of Variants (millions)")+
       theme_bw()+
      theme(plot.title = element_text(hjust = 0.5,size=24,face="bold"),
      axis.ticks.length=unit(5,"pt"),
      axis.text.x=element_text(size=20),
      axis.title.x=element_text(size=24),
      axis.text.y=element_text(size=20),
      axis.title.y=element_text(size=24),
      panel.border = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      axis.line = element_line(colour = "black"),
      legend.text=element_text(size=24),
      legend.title=element_text(size=24),
      legend.position=c(0.8,0.8))

ggsave(file="AF.svg",plot=pp)
