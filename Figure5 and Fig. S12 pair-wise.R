library(ggplot2)
library(Hmisc)
library(ggpubr)
library(ggplot2)
library(reshape2)
library(svglite)
data_summary <- function(x) {
  m <- mean(x)
  ymin <- m-sd(x)
  ymax <- m+sd(x)
  return(c(y=m,ymin=ymin,ymax=ymax))
}

FstDF <- read.csv('./input/Fst.tsv', header = T, sep = '\t')
p1 <- ggplot(FstDF, aes(x=Region, y=Fst, color=Region)) + 
  geom_boxplot(width=0.6, size=0.6, notch = TRUE)+
  scale_y_continuous(limits=c(0, 1.3))+
  labs(x = "", y = "Pair-wise Fst (x1000)")+
  geom_jitter(position=position_jitter(0.15), size=2)+
  scale_color_manual(values=c("#5CADAD", "#8080C0"))+
  theme(axis.title.y = element_text(size = 20, color = 'black'))+
  theme(axis.line = element_line(size = 0.5, color = 'black'))+
  theme(axis.text.y = element_text(size = 18, color = 'black'))+
  theme(axis.text.x = element_text(angle=45,vjust = 0.5, size = 18, color = 'black'))+
  theme(panel.grid.major=element_line(colour=NA))+
  theme(panel.grid.minor=element_line(colour=NA))+
  theme(panel.background = element_blank())+
  theme(legend.position="none")

IBDDF <- read.csv('./input/IBDseq.tsv', header = T, sep = '\t')
p2 <- ggplot(IBDDF, aes(x=Region, y=IBDseq, color=Region)) + 
  geom_boxplot(width=0.6, size=0.6, notch = TRUE)+
  scale_y_continuous(limits=c(11, 14))+
  geom_jitter(position=position_jitter(0.15), size=2)+
  labs(x = "", y = "Normalized Pair-wise IBD segement counts")+
  scale_color_manual(values=c("#5CADAD", "#8080C0"))+
  theme(axis.title.y = element_text(size = 20, color = 'black'))+
  theme(axis.line = element_line(size = 0.5, color = 'black'))+
  theme(axis.text.y = element_text(size = 18, color = 'black'))+
  theme(axis.text.x = element_text(angle=45,vjust = 0.5, size = 18, color = 'black'))+
  theme(panel.grid.major=element_line(colour=NA))+
  theme(panel.grid.minor=element_line(colour=NA))+
  theme(panel.background = element_blank())+
  theme(legend.position="none")

DriftDF <- read.csv('./input/Drift_diff.tsv', header = T, sep = '\t')
DriftDF$Drift_diff <- DriftDF$Drift_diff * 1000
p3 <- ggplot(DriftDF, aes(x=Region, y=Drift_diff, color=Region)) + 
  geom_boxplot(width=0.6, size=0.6, notch = TRUE)+
  scale_y_continuous(limits=c(0, 0.4))+
  labs(x = "", y = "Pair-wise Drift difference (x1000)")+
  geom_jitter(position=position_jitter(0.15), size=2)+
  scale_color_manual(values=c("#5CADAD", "#8080C0"))+
  theme(axis.title.y = element_text(size = 20, color = 'black'))+
  theme(axis.line = element_line(size = 0.5, color = 'black'))+
  theme(axis.text.y = element_text(size = 18, color = 'black'))+
  theme(axis.text.x = element_text(angle=45,vjust = 0.5, size = 18, color = 'black'))+
  theme(panel.grid.major=element_line(colour=NA))+
  theme(panel.grid.minor=element_line(colour=NA))+
  theme(panel.background = element_blank())+
  theme(legend.position="none")



pa <- ggarrange(p1, p2, p3, ncol=3,nrow=1,labels=c("A","B","C","D"),widths=c(1,1),heights = c(1,1))
pa
ggsave(file="North-vs-South_diff.svg", plot=pa, width=7, height=7)
