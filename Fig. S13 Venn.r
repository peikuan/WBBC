library(VennDiagram)
venn.plot <- draw.quad.venn(
area1=129,
area2=129,
area3=130,
area4=130,
n12=73,
n13=76,
n14=53,
n23=67,
n24=55,
n34=64,
n123=52,
n124=42,
n134=42,
n234=42,
n1234=34,
category = c("North", "Central", "South", "Lingnan"),
fill = c("dodgerblue", "MediumPurple", "darkorange1", "seagreen3"),
cat.col = c("dodgerblue", "MediumPurple", "darkorange1", "seagreen3"),
cat.cex = 1.2,
margin = 0.05,
cex = c(1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5),
ind = TRUE);


# Writing to file
png(filename = "Quintuple_Venn_diagram.png", height=800,width=800,);

grid.draw(venn.plot);
dev.off();

