if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)
}
setwd("~/Jandraor/Projects/Sunshine Coast/Data/Datasets/ABS/Qld Population/2015-10-22")


data         <- read.csv("QldPopulationASGS2014.csv")
SC.data      <- data[grepl("Sunshine Coast",data[[5]]),] 

grouped.data <- group_by(SC.data,Time)

Pop.by.year  <- summarise(grouped.data, Population= sum(Value),Region="Sunshine Coast")

write.csv(Pop.by.year,"SCPopulationASGS2014.csv", row.names=F)