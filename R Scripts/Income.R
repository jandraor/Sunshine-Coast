IncomeABS<-function(file.name,directory){

## It is loaded the 'xlsx' package. If it isn't installed, then it is done by this code
if(!require(xlsx)){
    install.packages("xlsx")
    library(xlsx)
}
directory<- "~/Jandraor/Projects/Sunshine Coast/Data/Datasets/ABS/Income/"
setwd(directory)
lower.bounds    <- seq(0,1900,100)
upper.bounds    <- seq(100,2000,100)
intervals       <- paste0(lower.bounds,"-",upper.bounds)

file            <- paste0(directory,"QLDIndQL3.xlsx")
colIndex        <- 8
rowIndex        <- 7:19
IncomeData      <- read.xlsx(file,sheetIndex = 1,colIndex = colIndex ,rowIndex = rowIndex ,header = F)
temp            <- IncomeData[[1]]
f1              <- temp[1] + temp[2] + temp[3]/2 
f2              <- temp[3]/2
f3              <- temp[4]
f4              <- temp[5] 
f5              <- temp[6]/2
f6              <- temp[6]/2
f7              <- temp[7]/2
f8              <- temp[7]/2
f9              <- temp[8]/2
f10             <- temp[8]/2
f11             <- temp[9] * (2/5)
f12             <- temp[9] * (2/5)
f13             <- temp[9]/5 + temp[10]/5 
f14             <- temp[10] * (2/5)
f15             <- temp[10] * (2/5)
f16             <- temp[11]/5 
f17             <- temp[11]/5
f18             <- temp[11]/5
f19             <- temp[11]/5
f20             <- temp[11]/5
f21             <- temp[12]
not.stated      <- temp[13]
frequencies     <- c(f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20)
Incomes         <- data.frame(Interval=intervals,Lower.Bound=lower.bounds,Upper.Bound=upper.bounds, Frequency=frequencies)
source('~/Jandraor/Projects/Sunshine Coast/R Scripts/MedianOI.R')
median          <- MedianOI(Incomes,sum(Incomes$Frequency) +f21)
median.income   <- median * 52
}
