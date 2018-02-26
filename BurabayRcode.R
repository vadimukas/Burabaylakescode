#read and write input file 1 to model
library(readr)
input_2<-read.csv("D:/R/Burabaylakescode/Inputfile20132016tocalculate3lakeEBfluxes3_EC_H_LE_updated.txt", header = TRUE, sep="\t", na.strings="-999")
input_1 <- read_delim("D:/R/Burabaylakescode/Inputfile20132016tocalculate3lakeEBfluxes3_EC_H_LE_updated.txt","\t", escape_double = FALSE, trim_ws = TRUE)
View(input_1)
write.table(input_1, file = 'input_1.txt', sep = '\t')
write.table(input_2, file = 'input_2.txt', sep = '\t')