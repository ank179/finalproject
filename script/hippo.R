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
