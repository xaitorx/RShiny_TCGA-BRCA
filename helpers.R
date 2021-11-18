scaTTerplot = function( dataSSet, columna1, columna2) {
  p <- ggplot(dataSSet, aes(dataSSet[,columna1], dataSSet[,columna2]))
  p + geom_point(aes(colour = dataSSet[,5], size = 2, alpha = 0.5)) +
    labs(x = columna1, y = columna2, element_text(face = "bold", angle = 0)) +
    geom_smooth(method="lm", color = "red") + theme(axis.line = element_line(size = 3, colour = "grey80")) +
    scale_colour_manual(values = c("darkred", "black", "cyan", "darkblue", "khaki",  "grey50")) +  
    guides(colour = guide_legend("BC subtypes", override.aes = list(size=5), title.theme = element_text(face = "bold", angle = 0)), size = "none") +
    annotate('text', x = max(dataSSet[,columna1])-0.5, y = max(dataSSet[,columna2])-0.5 ,label = paste("R^{2}==", round(cor(dataSSet[,columna1], dataSSet[,columna2]), digits = 4)), parse = TRUE, size=6) +
    annotate('text', x = max(dataSSet[,columna1])-0.5, y = max(dataSSet[,columna2])-1.5,label =paste("P-value==",cor.test(dataSSet[,columna1], dataSSet[,columna2])$p.value), parse = TRUE, size=3) 
}


boXXplot = function(dataSSet, columna3) {
  p <- ggplot(dataSSet, aes(dataSSet[,5], dataSSet[,columna3], fill = dataSSet[,5]))
  p + geom_boxplot(outlier.shape = NA, size =2, alpha = 0.5) + 
    geom_point(aes(), size = 2, position = position_jitterdodge()) + 
    labs(x="", y = "DGAT2 mRNA expression", element_text(face = "bold", angle = 0)) + 
    scale_fill_manual(values =  c("green", "red", "black")) + # you can change colors here if you want
    theme(panel.background = element_rect( colour = "grey50"), axis.text.x = element_text(angle = 45, hjust = 1, size = 12)) + 
    theme_bw() +
    theme(text = element_text(size=20))
}








