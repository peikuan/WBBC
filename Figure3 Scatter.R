library(ggpubr)
library(ggplot2)
library(reshape2)
library(svglite)
library("gridExtra")

blankPlot <- ggplot()+geom_blank(aes(1,1))+
  theme(plot.background = element_blank(), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(), 
        axis.text.y = element_blank(),
        axis.ticks = element_blank()
  )

Data<-read.table("./input/summary_impu2array_concordance_changeOrder.tsv", head=T, sep='\t')
Data$panel <- factor(Data$panel, levels = c('CONV', 'OKG', 'WBBC', 'WBEA', 'WBKG'))

p1 <- ggplot(Data, aes(x=AB_ccd, y=BB_ccd, color=panel))
p1 <- p1 + geom_point(size=3)
p1 <- p1 + scale_color_manual(values=c("#00AEAE","#FF9224","#AE0000","#003D79","#4F4F4F"))
p1 <- p1 + labs(x = "", y = "")
p1 <- p1 + theme_bw()
p1 <- p1 + theme(panel.grid.major=element_line(colour=NA))
p1 <- p1 + theme(panel.grid.minor=element_line(colour=NA))
p1 <- p1 + theme(panel.border = element_rect(color = 'black', size = 1))  
p1 <- p1 + theme(axis.text.x = element_text(size = 14, color = 'black'))
p1 <- p1 + theme(axis.text.y = element_text(size = 14, color = 'black'))
p1 <- p1 + theme(legend.position="none")
p1
# Marginal density plot of x (top panel)
xdensity <- ggplot(Data, aes(AB_ccd, fill=panel)) + 
  geom_density(alpha=.5, size=.8) + 
  scale_fill_manual(values = c("#00AEAE","#FF9224","#AE0000","#003D79","#4F4F4F")) +
  labs(x = "", y = "") +
  theme_bw() +
  theme(panel.grid.major=element_line(colour=NA)) +
  theme(panel.grid.minor=element_line(colour=NA)) +
  theme(panel.border = element_blank()) +
  theme(axis.text.x = element_blank()) +
  theme(axis.text.y = element_text(size = 14, color = 'black')) +
  theme(legend.position = "none", axis.ticks = element_blank())
xdensity

# Marginal density plot of y (right panel)
ydensity <- ggplot(Data, aes(BB_ccd, fill=panel)) + 
  geom_density(alpha=.5, size=.8) + 
  scale_fill_manual(values = c("#00AEAE","#FF9224","#AE0000","#003D79","#4F4F4F")) +
  labs(x = "", y = "") +
  coord_flip() +
  theme_bw() +
  theme(panel.grid.major=element_line(colour=NA)) +
  theme(panel.grid.minor=element_line(colour=NA)) +
  theme(panel.border = element_blank()) +
  theme(axis.text.x = element_text(size = 14, color = 'black')) +
  theme(axis.text.y = element_blank()) +
  theme(legend.position = "none", axis.ticks = element_blank())
ydensity

merge <- grid.arrange(xdensity, blankPlot, p1, ydensity, 
             ncol=2, nrow=2, widths=c(4, 1), heights=c(1, 4))

ggsave(file="summary_array_ccd_version1.svg", plot=merge, width=7.5, height=6)

