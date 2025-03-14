# Preprocess data, write TAF data tables

# Before: DESCRIPTION (boot/data)
# After:  imports.csv (data)

library(TAF)

mkdir("data")

# Read Imports entry from DESCRIPTION file
imports <- read.dcf("boot/data/DESCRIPTION", fields="Imports")

# Split long string into package names
imports <- unlist(strsplit(imports, "\\n"))
imports <- sub(",", "", imports)    # remove comma
imports <- sub(" .*", "", imports)  # remove version number
imports <- data.frame(package=imports)

# Write TAF table
write.taf(imports, dir="data")
