#changing working directory 
getwd()
setwd("/Users/anyakapur/Desktop/Biostat/Finalproject/script")


#loading data 
setwd("/Users/anyakapur/Desktop/Biostat/Finalproject/data")
hipp <- read.csv("hippvolume.csv")

#summary of hipp data 
summary(hipp)

#analysis 

setwd("/Users/anyakapur/Desktop/Biostat/Finalproject/results")
hipp$group <- factor(hipp$group, levels = c("no seizures", "no CFS", "CFS")) 
hipp
hippAnova <- lm(hipp$hippoVolumeRatio ~ group, data = hipp)
anova(hippAnova)
out <- capture.output(anova(hippAnova))
cat("hippAnova_results", out, file="hippAnova_results.txt", sep="n", append=TRUE)

#making strip charts 
setwd("/Users/anyakapur/Desktop/Biostat/Finalproject/results")
pdf("hipp_plot.pdf")
graph <- stripchart(hipp$hippoVolumeRatio ~ hipp$group, data = hipp, method = "jitter",
                    vertical = TRUE, ylab = "Hippocampus Volume Ratio (%)", xlab = "Patients", col = c("coral3", "darkslategrey", "darkolivegreen"), cex = 1.5, 
                    main = "Hippocampus Volume Ratio for Patients", pch=16)
meanHipVol = tapply(hipp$hippoVolumeRatio, hipp$group, mean)
segments(x0 = c(1,2,3) - 0.1, y0 = meanHipVol, x1 = c(1,2,3) + 0.1, 
         y1 = meanHipVol, lwd = 2)
dev.off()