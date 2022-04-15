library(ggplot2)
library(RColorBrewer)
col <- colorRampPalette(brewer.pal(9,'Set1'))(9)

pdf(file= "K2.pdf",width=3, height=12);
tbl<-read.table('./input/WBBC_1000G_chip_QC.2.Q.t',sep='\t')
indTable<-read.table('MinSS_ind',sep='\t',col.names=c("Sample","Pop"))
mergedAdmixtureTable = cbind(tbl, indTable)
barplot(t(as.matrix(subset(mergedAdmixtureTable, select=V1:V2))), col=c(col[7],col[2]),border=NA,horiz = TRUE, space=0,las=2,ylab="K=2")
abline(h = c(104,203,296,401,504,529,570,612,762,912,995,1034,1159,1274,1307,1451,1539,1581,1705,1764,1871,1887,1936,1986,2026,2074,2189,2207,2279,2307,2410),lty=1,lwd=0.5)

dev.off();


pdf(file= "K3.pdf",width=3, height=12);
tbl<-read.table('./input/WBBC_1000G_chip_QC.3.Q.t',sep='\t')
indTable<-read.table('MinSS_ind',sep='\t',col.names=c("Sample","Pop"))
mergedAdmixtureTable = cbind(tbl, indTable)
barplot(t(as.matrix(subset(mergedAdmixtureTable, select=V1:V3))), col=c(col[7],col[2],col[9]),border=NA,horiz = TRUE, space=0,las=2,ylab="K=3")
abline(h = c(104,203,296,401,504,529,570,612,762,912,995,1034,1159,1274,1307,1451,1539,1581,1705,1764,1871,1887,1936,1986,2026,2074,2189,2207,2279,2307,2410),lty=1,lwd=0.5)
dev.off();




pdf(file= "K4.pdf",width=3, height=12);
tbl<-read.table('./input/WBBC_1000G_chip_QC.4.Q.t',sep='\t')
indTable<-read.table('MinSS_ind',sep='\t',col.names=c("Sample","Pop"))
mergedAdmixtureTable = cbind(tbl, indTable)
barplot(t(as.matrix(subset(mergedAdmixtureTable, select=V1:V4))), col=c(col[7],col[5],col[2],col[9]), border=NA,horiz = TRUE,space=0,las=2,ylab="K=4")
abline(h = c(104,203,296,401,504,529,570,612,762,912,995,1034,1159,1274,1307,1451,1539,1581,1705,1764,1871,1887,1936,1986,2026,2074,2189,2207,2279,2307,2410),lty=1,lwd=0.5)
dev.off();



pdf(file= "K5.pdf",width=3, height=12);
tbl<-read.table('./input/WBBC_1000G_chip_QC.5.Q.t',sep='\t')
indTable<-read.table('MinSS_ind',sep='\t',col.names=c("Sample","Pop"))
mergedAdmixtureTable = cbind(tbl, indTable)
barplot(t(as.matrix(subset(mergedAdmixtureTable, select=V1:V5))), col=c(col[7],col[5],col[4],col[2],col[9]), border=NA,horiz = TRUE,space=0,las=2,ylab="K=5")
abline(h = c(104,203,296,401,504,529,570,612,762,912,995,1034,1159,1274,1307,1451,1539,1581,1705,1764,1871,1887,1936,1986,2026,2074,2189,2207,2279,2307,2410),lty=1,lwd=0.5)
dev.off();



pdf(file= "K6.pdf",width=3, height=12);
tbl<-read.table('./input/WBBC_1000G_chip_QC.6.Q.t',sep='\t')
indTable<-read.table('MinSS_ind',sep='\t',col.names=c("Sample","Pop"))
mergedAdmixtureTable = cbind(tbl, indTable)
barplot(t(as.matrix(subset(mergedAdmixtureTable, select=V1:V6))), col=c(col[7],col[5],col[8],col[2],col[1],col[9]), border=NA,horiz = TRUE,space=0,las=2,ylab="K=6")
abline(h = c(104,203,296,401,504,529,570,612,762,912,995,1034,1159,1274,1307,1451,1539,1581,1705,1764,1871,1887,1936,1986,2026,2074,2189,2207,2279,2307,2410),lty=1,lwd=0.5)
dev.off();

