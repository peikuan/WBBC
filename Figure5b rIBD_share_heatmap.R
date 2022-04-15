library(ggcor)
library(ggplot2)
library(RColorBrewer)
library(pheatmap)

mydata1 <- read.csv('./input/sharedIBDMatrix_v1.tsv', row.names = 1, header = T, sep = '\t')
data_matrix<-as.matrix(mydata1)

annotation_col = data.frame(
  Class = factor(rep(c('North', 'Central', 'South', 'Lingnan'), c(13, 2, 9, 3))))
rownames(annotation_col) = c('Tianjin', 'Hebei', 'Gansu', 'Qinghai', 'Ningxia', 'Shanxi', 'InnerMongolia', 'Liaoning', 'Jilin', 'Heilongjiang', 'Shandong', 'Shaanxi', 'Henan', 'Jiangsu', 'Anhui', 'Zhejiang', 'Fujian', 'Jiangxi', 'Hubei', 'Hunan', 'Chongqing', 'Sichuan', 'Guizhou', 'Yunnan', 'Hainan', 'Guangxi', 'Guangdong')

annotation_row = data.frame(
  Class = factor(rep(c('North', 'Central', 'South', 'Lingnan'), c(13, 2, 9, 3))))
rownames(annotation_row) = c('Tianjin', 'Hebei', 'Gansu', 'Qinghai', 'Ningxia', 'Shanxi', 'InnerMongolia', 'Liaoning', 'Jilin', 'Heilongjiang', 'Shandong', 'Shaanxi', 'Henan', 'Jiangsu', 'Anhui', 'Zhejiang', 'Fujian', 'Jiangxi', 'Hubei', 'Hunan', 'Chongqing', 'Sichuan', 'Guizhou', 'Yunnan', 'Hainan', 'Guangxi', 'Guangdong')

ann_colors = list(
  Class = c(North = "#5CADAD", Central = "#AD5A5A", South = "#8080C0", Lingnan = "#A5A552")
)

p<-pheatmap(data_matrix,border=FALSE, cellwidth = 10, cellheight = 10, fontsize = 8, 
            cluster_rows = TRUE, cluster_cols = TRUE, annotation_col = annotation_col,annotation_row = annotation_row, annotation_colors = ann_colors,
            main = "rIBD heatmap normlize 1", color = colorRampPalette(brewer.pal(9,"Blues")[3:9])(100))

ggsave(file="./rIBD_norm1.svg", plot=p)


