if(!require(xlsx)){
    install.packages("xlsx")
    library(xlsx)
}

dir<- paste0("~/Jandraor/Projects/Sunshine Coast/Data/Datasets/ABS/Deaths/2015-10-22")
setwd(dir)
colIndex<- 3:53
rowIndex<- c(6,69)
DeathsData <- read.xlsx("DeathsASGS2011.xls",sheetIndex = 4,colIndex=colIndex, rowIndex = rowIndex,header=TRUE)
Years<- c(2001:2013)
Deaths<- as.numeric(DeathsData[seq(2,50,4)])
SunCstRegion.Population <- as.numeric(DeathsData[seq(1,49,4)])
data<- data.frame(Time= Years, Deaths=Deaths, Population=SunCstRegion.Population, Region= "Sunshine Coast (R) ASGS 2011")
data$Birth.Rate<- with(data, Deaths/Population)
write.csv(data,"SunCstASGS2011deaths.csv", row.names=F)