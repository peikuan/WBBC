
#all
library("ggplot2")
library(scales)
data<-read.table('./input/pieall',sep='\t',header=TRUE)
data$Function<-factor(data$Function,levels=c("intergenic","intronic","unknown","UTR5/UTR3","upstream/downstream","ncRNA","coding and splicing regions"))

p1<-ggplot(data,aes(y=NN,x="",fill=Function))+
    geom_bar(stat="identity",width=1)+
    coord_polar(theta="y",direction=1)+
    scale_fill_manual(values=c("intergenic" = "#A6CEE3", "intronic" = "#2B7FB8",  "coding and splicing regions" = "#F8766D",    "ncRNA" = "#97CC91","UTR5/UTR3" = "#55B145","upstream/downstream" = "#B89CCB","unknown" = "#774E99"))+
    theme_bw() +


    theme(axis.text.x=element_blank(),
    axis.title.x=element_blank(),
    axis.title.y=element_blank(),
    axis.text.y=element_blank(),
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.position = "top",
    legend.text=element_text(size=20),
    legend.title=element_text(size=24))


ggsave(file="pieall.svg",plot=p1,width=13,height=8)



##exon
#pie
library("ggplot2")
library(scales)
data<-read.table('./input/pieexon',sep='\t',header=TRUE)
data$Function<-factor(data$Function,levels=c("missense","deletion/insertion","synonymous","start/stop-gain/loss","splicing"))

p2<-ggplot(data,aes(y=NN,x="",fill=Function))+
    geom_bar(stat="identity",width=1)+
    coord_polar(theta="y",direction=1)+
    scale_fill_manual(values=c("missense" = "#B29C71",     "synonymous" = "#FDA746",    "deletion/insertion" = "#ED5454",    "splicing" = "#F08C3A",    "start/stop-gain/loss" = "#EE6441"))+
    theme_bw() +


    theme(axis.text.x=element_blank(),
    axis.title.x=element_blank(),
    axis.title.y=element_blank(),
    axis.text.y=element_blank(),
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.position = "top",
    legend.text=element_text(size=20),
    legend.title=element_text(size=24))

ggsave(file="pieexon.svg",plot=p2,width=13,height=8)







