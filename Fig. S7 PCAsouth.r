library(ggplot2)
theme_set(theme_bw())
data<-read.table('./input/PCAsouth.PCA.evec.txt',sep=' ',header=F)
names(data)=c("sf","ID","PC1","PC2","PC3","PC4","PC5","PC6")
gg<-ggplot(data,aes(x=PC2,y=PC1))+
geom_point(
pch=c(rep('M',201),rep('H',19),rep('G',39),rep('E',37),rep('R',38),rep('A',116),rep('D',137),rep('O',97),rep('t',90),rep('a',48),rep('N',42),rep('Q',26),rep('g',100),rep('h',64),rep('T',14),rep('I',36),rep('j',44),rep('L',17),rep('r',43),rep('Y',78),rep('U',71),rep('V',129),rep('n',132),rep('F',113),rep('d',105),rep('C',35),rep('W',27),rep('Z',125)),
col=c(rep('grey',201),rep('grey',19),rep('grey',39),rep('grey',37),rep('grey',38),rep('grey',116),rep('grey',137),rep('grey',97),rep('grey',90),rep('grey',48),rep('grey',42),rep('grey',26),rep('grey',100),rep('grey',64),rep('grey',14),rep('grey',36),rep('grey',44),rep('grey',17),rep('grey',43),rep('#A6A6D2',78),rep('#A6A6D2',71),rep('#A6A6D2',129),rep('#A6A6D2',132),rep('#A6A6D2',113),rep('#A6A6D2',105),rep('#A6A6D2',35),rep('#A6A6D2',27),rep('#A6A6D2',125)),
cex=4,stroke = 5)+
labs(x="PC2 (0.16%)",y="PC1 (0.26%)",title="South")+
theme(plot.title = element_text(hjust = 0.5,size=30,face="bold"),
      axis.ticks.length=unit(7,"pt"),
      axis.text.x=element_text(size=18),
      axis.title.x=element_text(size=24),
      axis.text.y=element_text(size=18),
      axis.title.y=element_text(size=24))

ggsave(file="PCAsouth.svg",plot=gg)
