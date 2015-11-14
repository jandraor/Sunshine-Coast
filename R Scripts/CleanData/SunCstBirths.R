if(!require(xlsx)){
    install.packages("xlsx")
    library(xlsx)
}

dir<- paste0("~/Jandraor/Projects/Sunshine Coast/Data/Datasets/ABS/Births/2015-10-22")
setwd(dir)
colIndex<- 3:53
rowIndex<- c(6,69)
BirthsData <- read.xlsx("BirthsASGS2011.xls",sheetIndex = 4,colIndex=colIndex, rowIndex = rowIndex,header=TRUE)
Years<- c(2001:2013)
Births<- as.numeric(BirthsData[seq(2,50,4)])
SunCstRegion.Population <- as.numeric(BirthsData[seq(1,49,4)])
data<- data.frame(Time= Years, Births=Births, Population=SunCstRegion.Population, Region= "Sunshine Coast (R) ASGS 2011")
data$Birth.Rate<- with(data, Births/Population)
write.csv(data,"SunCstASGS2011births.csv", row.names=F)

