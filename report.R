# Prepare plots and tables for report

# Before: count.csv (output)
# After:  count.png (report)

library(TAF)

mkdir("report")

# Read results
count <- read.taf("output/count.csv")
n <- count$Dependencies[count$Package == "sraplus"]

# Plot
main <- paste0("Dependencies of sraplus (n = ", n, ")")
taf.png("count", 1200, 1600)
par(plt=c(0.26,0.90,0.11,0.90))
barplot(count$Dependencies, names=count$Package, horiz=TRUE, las=1,
        main=main, xlab="Dependencies", col="burlywood")
dev.off()
