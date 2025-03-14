# Run analysis, write model results

# Before: imports.csv (data), pdeps.R (boot/software)
# After:  dependencies.RData (model)

library(TAF)
library(tools)
source("boot/software/pdeps.R")
options(repos=c(CRAN="https://cloud.r-project.org"))

mkdir("model")

# Read imported package names
imports <- read.taf("data/imports.csv")$package

# Analyze primary and secondary dependencies
primary <- sort(unique(imports))
secondary.list <- pdeps(imports)

# Write results
save(primary, secondary.list, file="model/dependencies.RData")
