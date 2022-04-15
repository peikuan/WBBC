library(pheatmap)
data<-read.table('./input/SDS-pheatmap.txt',sep='\t',header=TRUE,row.names=1,check.names=F)
pheatmap(data,cluster_rows=F,cluster_cols=F,border_color=NA,display_numbers = TRUE,number_color = "black", fontsize = 16,angle_col = "45")

