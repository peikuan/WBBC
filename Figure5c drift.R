library(ggplot2)
source("./plotting_funcs.R")
library("stringr")


ggsave(file="./Main_drift.svg", plot = plot_tree("./input/Han27-Heilongjiang/Han27-Heilongjiang", 
                                                              o = NA, cex = 0.8, disp = 0.000025, plus = 0.0002, 
                                                              flip = vector(), arrow = 0.1, scale = T, 
                                                              ybar = 0.1, mbar = F, plotmig = F, plotnames = T, 
                                                              xmin = 0, lwd = 1.3, font = 1), width=7, height=7)
