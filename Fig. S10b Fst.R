setwd('F:/res_data_plot')
library(ggcor)
library(ggplot2)
library(RColorBrewer)
library(pheatmap)
library(svglite)
mydata1 <- read.csv('./input/Han27_weightFst.csv', row.names = 1, header = T, sep = ',')
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
            main = "27 Provinces of China", color = colorRampPalette(brewer.pal(11,"Spectral")[3:6])(100),
            angle_col = 45,
            legend_labels = 'Fst x 1000')

ggsave(file="./Fst_Han27_final_revision.svg", plot=p)


#----------------------------------------------------------------------------------------------------
mydata1 <- read.csv('./input/OKG26_Region4_weightFst.csv', row.names = 1, header = T, sep = ',')
data_matrix<-as.matrix(mydata1)

annotation_col = data.frame(
  Class = factor(rep(c('WBBC', 'EAS', 'EUR', 'AFR', 'AMR', 'SAS'), c(4, 5, 5, 7, 4, 5))))
rownames(annotation_col) = c('North', 'Central', 'South', 'Lingnan',
                             'CHB', 'JPT', 'CHS', 'CDX', 'KHV', 'CEU', 'TSI', 'FIN', 'GBR', 'IBS', 'YRI', 'LWK', 'GWD', 'MSL', 'ESN', 'ASW', 'ACB', 'MXL', 'PUR', 'CLM', 'PEL', 'GIH', 'PJL', 'BEB', 'STU', 'ITU')

annotation_row = data.frame(
  Class = factor(rep(c('WBBC', 'EAS', 'EUR', 'AFR', 'AMR', 'SAS'), c(4, 5, 5, 7, 4, 5))))
rownames(annotation_row) = c('North', 'Central', 'South', 'Lingnan',
                             'CHB', 'JPT', 'CHS', 'CDX', 'KHV', 'CEU', 'TSI', 'FIN', 'GBR', 'IBS', 'YRI', 'LWK', 'GWD', 'MSL', 'ESN', 'ASW', 'ACB', 'MXL', 'PUR', 'CLM', 'PEL', 'GIH', 'PJL', 'BEB', 'STU', 'ITU')

ann_colors = list(
  Class = c(SAS = "SeaGreen", AMR = "LightPink", AFR = "DarkGoldenrod", EUR = "SteelBlue", EAS = "Brown", WBBC = "Grey")
)

p<-pheatmap(data_matrix,border=FALSE, cellwidth = 10, cellheight = 10, fontsize = 8,
            cluster_rows = TRUE, cluster_cols = TRUE, annotation_col = annotation_col, annotation_row = annotation_row, annotation_colors = ann_colors,
            main = "28 China province and 26 OKG populations", color = colorRampPalette(brewer.pal(11,"Spectral")[2:6])(50), 
            display_numbers = TRUE, number_color = "grey40", number_format = "%.0f", fontsize_number = 5,
            legend_labels = 'Fst x 1000')

ggsave(file="./Fst_Region4_OKG26_withN.svg", plot=p)


