# Extract results of interest, write TAF output tables

# Before: dependencies.RData (model)
# After:  count.csv, packages.csv (output)

library(TAF)

mkdir("output")

load("model/dependencies.RData")  # primary, secondary.list

# Analyze primary and secondary dependencies
secondary <- sort(unique(unlist(secondary.list)))
secondary <- setdiff(secondary, primary)  # remove packages that are primary
dependencies <- sort(unique(c(primary, secondary)))

# Tabulate
count <- rev(sort(sapply(secondary.list, length)))
count <- c(sraplus=length(dependencies), count)
count <- data.frame(Package=names(count), Dependencies=count, row.names=NULL)
packages <- data.frame(Package=c(primary, secondary),
                       Dependency=rep(c("primary", "secondary"),
                                      c(length(primary), length(secondary))))

# Write TAF tables
write.taf(count, dir="output")
write.taf(packages, dir="output")
