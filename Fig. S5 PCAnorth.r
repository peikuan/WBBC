library(ggplot2)
theme_set(theme_bw())
data<-read.table('./input/PCAnorth.PCA.evec.txt',sep=' ',header=F)
names(data)=c("sf","ID","PC1","PC2","PC3","PC4","PC5","PC6")
gg<-ggplot(data,aes(x=PC2,y=PC1))+
geom_point(
pch=c(rep('M',201),rep('H',19),rep('G',39),rep('E',37),rep('Y',78),rep('U',71),rep('V',129),rep('n',132),rep('F',113),rep('d',105),rep('C',35),rep('W',27),rep('Z',125),rep('R',38),rep('A',116),rep('D',137),rep('O',97),rep('t',90),rep('a',48),rep('N',42),rep('Q',26),rep('g',100),rep('h',64),rep('T',14),rep('I',36),rep('j',44),rep('L',17),rep('r',43)),
col=c(rep('grey',201),rep('grey',19),rep('grey',39),rep('grey',37),rep('grey',78),rep('grey',71),rep('grey',129),rep('grey',132),rep('grey',113),rep('grey',105),rep('grey',35),rep('grey',27),rep('grey',125),rep('grey',38),rep('grey',116),rep('#81C0C0',137),rep('#81C0C0',97),rep('#81C0C0',90),rep('#81C0C0',48),rep('#81C0C0',42),rep('#81C0C0',26),rep('#81C0C0',100),rep('#81C0C0',64),rep('#81C0C0',14),rep('#81C0C0',36),rep('#81C0C0',44),rep('#81C0C0',17),rep('#81C0C0',43)),
cex=4,stroke = 5)+
labs(x="PC2",y="PC1",title="North")+
theme(plot.title = element_text(hjust = 0.5,size=30,face="bold"),
      axis.ticks.length=unit(7,"pt"),
      axis.text.x=element_text(size=18),
      axis.title.x=element_text(size=24),
      axis.text.y=element_text(size=18),
      axis.title.y=element_text(size=24))

ggsave(file="PCAnorth.svg",plot=gg)
