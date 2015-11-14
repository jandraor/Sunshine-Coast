## It is loaded the 'ggplot2' package. If it isn't installed, then it is done by this code
if(!require(ggplot2)){
    install.packages("ggplot2")
    library(ggplot2)
}

incomedata<-read.csv("./Data/Datasets/QldIncome.csv", colClasses="character")
SunCstInc  <- subset(incomedata, incomedata$Region=='Sunshine Coast')
GoldCstInc <- subset(incomedata, incomedata$Region=='Gold Coast')

source("./R Scripts/PrepareHistogram.R")

SCInc<- PrepareHistogram(SunCstInc)
GCInc<- PrepareHistogram(GoldCstInc)
SCInc<- data.frame(values=SCInc$values, region="Sunshine Coast")
GCInc<- data.frame(values=GCInc$values, region="Gold Coast")
QldIncomes<- rbind(SCInc,GCInc)

m <- ggplot(QldIncomes, aes(x=values, fill=factor(region)))
m <- m + geom_histogram(binwidth=100, aes(y = ..density..), colour="black")
m <- m + scale_fill_brewer(palette="Set1",guide=FALSE)
m <- m + facet_grid (.~region)
m <- m + scale_x_discrete(limits=seq(0,2000,200),labels= seq(0,2000,200)/100 )
m <- m + scale_y_continuous(breaks= seq(0,125,25)/100000, labels= seq(0,12.5,2.5))
m <- m + labs(x="Income [hundreds of dollars]", y="Density [% per $100]") + labs(title="WEEKLY REGIONAL INCOME")
ggsave("./Graphs/1-RegIncomeDistribution.png", dpi=800)

m <- ggplot(QldIncomes, aes(x=values, colour=factor(region)))
m <- m + scale_colour_brewer(palette="Set1",guide=FALSE)
m <- m + geom_density(adjust=3)
m <- m + facet_grid (.~region) 
m <- m + scale_x_continuous(breaks=seq(0,2000,200),labels= seq(0,2000,200)/100 )
m <- m + scale_y_continuous(breaks= seq(0,125,25)/100000, labels= seq(0,12.5,2.5))
m <- m + labs(x="Income [hundreds of dollars]", y="Density [% per $100]") + labs(title="WEEKLY REGIONAL INCOME")
print(m)

ggsave("./Graphs/2-RegIncomeDensity.png", dpi=800)

source("./R Scripts/MedianOI.R")
MedianSC <- round(MedianOI(SunCstInc,104492),0)
MedianGC <- round(MedianOI(GoldCstInc,182503),0)
M.textSC <- paste0("Median = $ ",MedianSC)
M.textGC <- paste0("Median = $ ",MedianGC)

sumstats<- data.frame(median=c(MedianSC,MedianGC),region=c("Sunshine Coast","Gold Coast"))
m<-  m + geom_vline(aes(xintercept = median), sumstats,linetype = "longdash")
labels <- data.frame(x = c(1200,1200), y = rep(0.00075,2),region=c("Sunshine Coast","Gold Coast"),labs= c(M.textSC,M.textGC))
m<-  m + geom_text(aes(x, y, label=labs, group=NULL),data=labels, size=3) 

ggsave("./Graphs/3-RegMedianIncome.png", dpi=800)
