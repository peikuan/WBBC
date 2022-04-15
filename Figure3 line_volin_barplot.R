library(ggpubr)
library(ggplot2)
library(reshape2)
library(svglite)

Data<-read.table("./input/summary_mergeMS_concordance.tsv", head=T, sep='\t')
Data$maf <- factor(Data$maf, levels = c('RARE', 'LFRQ', 'COMM'))


p1 <- ggplot(data=Data, aes(x=maf, y=NR_ccd, color=panel, group=panel))
p1 <- p1 + geom_line(linetype=7, size=1.2)
p1 <- p1 + geom_point(shape='.', size=2)
p1 <- p1 + labs(x = "", y = "")
p1 <- p1 + geom_errorbar(aes(ymin=NR_ccd-NR_ccd_sem, ymax=NR_ccd+NR_ccd_sem), width=0.2, size=1)
p1 <- p1 + scale_color_manual(values=c("#00AEAE","#FF9224","#AE0000","#003D79","#4F4F4F"))
#p1 <- p1 + scale_y_continuous(limits=c(0.6, 1))
p1 <- p1 + theme_bw()
p1 <- p1 + theme(panel.grid.major=element_line(colour=NA))
p1 <- p1 + theme(panel.grid.minor=element_line(colour=NA)) 
p1 <- p1 + theme(panel.border = element_rect(color = 'black')) 
p1 <- p1 + theme(axis.text.x = element_text(angle=40,vjust = 0.5, size = 13.5, color = 'black'))
p1 <- p1 + theme(axis.text.y = element_text(size = 18, color = 'black'))
p1 <- p1 + theme(legend.position="none")



Data2<-read.table("./input/summary_mergeMaf_concordance_rmSampleID.tsv", head=T, sep='\t')
Data_melt <- melt(Data2, id.var="panel")

p2 <- ggplot(data=Data2, aes(x=panel,y=NR_ccd,color=panel))
p2 <- p2 + geom_violin(trim=TRUE, size=0.7, fill="grey", color="grey")
p2 <- p2 + scale_color_manual(values=c("#00AEAE","#FF9224","#AE0000","#003D79","#4F4F4F"))
p2 <- p2 + geom_boxplot(width=0.25, size=0.6, outlier.size = 1, notch=TRUE)
p2 <- p2 + labs(x = "", y = "")
p2 <- p2 + theme_bw()
p2 <- p2 + theme(panel.grid.major=element_line(colour=NA))
p2 <- p2 + theme(panel.grid.minor=element_line(colour=NA)) 
p2 <- p2 + theme(panel.border = element_rect(color = 'black')) 
p2 <- p2 + theme(axis.text.y = element_text(size = 18, color = 'black'))
p2 <- p2 + theme(axis.text.x = element_text(angle=45,vjust = 0.5, size = 14, color = 'black'))
p2 <- p2 + theme(legend.position="none")



pa <- ggarrange(p1, p2, ncol=3,nrow=2,labels=c("A","B"),widths=c(1,1),heights = c(1,1))
pa

ggsave(file="summary_seq_ccd.svg", plot=pa, width=10.2, height=6.8)

