library(qqman) 
data<-read.table('./input/manhattanplot.txt',sep='\t',header=TRUE)
tiff("manhattan.tif",width=1600,height=400,compression="lzw")

p<-manhattan(data,
          cex=1.4,
          cex.axis=1.2,
          cex.lab=1.4,
          xlab="Chromosome",
          ylab=expression(-log[10](italic(P))),
          col=1:22,
          ylim=c(0,20),
          suggestiveline=F,
          genomewideline=-log10(5E-08))

dev.off()



