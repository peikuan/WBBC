library(ggplot2)
theme_set(theme_bw())
data<-read.table('./input/PCAasian.PCA.evec.txt',sep=' ',header=F)
names(data)=c("sf","ID","PC1","PC2","PC3","PC4","PC5","PC6")
p1<-ggplot(data,aes(x=PC2,y=PC1))+
geom_point(
pch=c(rep('M',202),rep('H',21),rep('G',38),rep('E',36),rep('Y',80),rep('U',73),rep('V',132),rep('n',138),rep('F',112),rep('d',104),rep('C',36),rep('W',27),rep('Z',127),rep('R',36),rep('A',115),rep('D',137),rep('O',97),rep('t',89),rep('a',49),rep('N',41),rep('Q',26),rep('g',103),rep('h',63),rep('T',15),rep('I',37),rep('j',45),rep('L',18),rep('r',44),rep('K',98),rep('J',104)),
col=c(rep('grey',202),rep('grey',21),rep('grey',38),rep('grey',36),rep('grey',80),rep('grey',73),rep('grey',132),rep('grey',138),rep('grey',112),rep('grey',104),rep('grey',36),rep('grey',27),rep('grey',127),rep('grey',36),rep('grey',115),rep('grey',137),rep('grey',97),rep('grey',89),rep('grey',49),rep('grey',41),rep('grey',26),rep('grey',103),rep('grey',63),rep('grey',15),rep('grey',37),rep('grey',45),rep('grey',18),rep('grey',44),rep('#1E90FF',98),rep('#1E90FF',104)),
cex=4,stroke = 5)+
labs(x="PC2",y="PC1")+
theme(plot.title = element_text(hjust = 0.5,size=20,face="bold"),
      axis.ticks.length=unit(5,"pt"),
      axis.text.x=element_text(size=14),
      axis.title.x=element_text(size=20),
      axis.text.y=element_text(size=14),
      axis.title.y=element_text(size=20))
ggsave(file="PCAasian.svg",plot=p1)



