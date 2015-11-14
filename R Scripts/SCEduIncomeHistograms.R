## It is loaded the 'ggplot2' package. If it isn't installed, then it is done by this code
if(!require(ggplot2)){
    install.packages("ggplot2")
    library(ggplot2)
}
## It is loaded the 'R Color Brewer' package. If it isn't installed, then it is done by this code
if(!require(RColorBrewer)){
    install.packages("RColorBrewer")
    library(RColorBrewer)
}

incomedata<-read.csv("./Data/Datasets/EducationSCIncome.csv", colClasses="character")
income01<- subset(incomedata, incomedata$Year==2001)
income06<- subset(incomedata, incomedata$Year==2006)
income11<- subset(incomedata, incomedata$Year==2011)

source("./R Scripts/PrepareHistogram.R")

ph01<- PrepareHistogram(income01)
ph01<- data.frame(values=ph01$values, year=rep(2001, length(ph01$values)))
ph06<- PrepareHistogram(income06)
ph06<- data.frame(values=ph06$values, year=rep(2006, length(ph06$values)))
ph11<- PrepareHistogram(income11)
ph11<- data.frame(values=ph11$values, year=rep(2011, length(ph11$values)))
incomes<- rbind(ph01,ph06,ph11)

m <- ggplot(incomes, aes(x=values, fill=factor(year)))
##m <- m + scale_colour_brewer(palette="Set1")
m <- m + scale_fill_brewer(palette="Set1",guide=FALSE)
m <- m + geom_histogram(binwidth=100, aes(y = ..density..), colour="black")
#m <- m + geom_density()
m <- m + facet_grid (.~year) 
m <- m + scale_x_discrete(limits=seq(0,2000,200),labels= seq(0,2000,200)/100 )
m <- m + scale_y_continuous(breaks= seq(0,125,25)/100000, labels= seq(0,12.5,2.5))
m <- m + labs(x="Income [hundreds of dollars]", y="% per $100") + labs(title="SUNSHINE COAST'S EDUCATION NOMINAL INCOME: 2001,2006 & 2011 ")

ggsave("./Graphs/1-SCIncomeDistribution.png", dpi=800)

m <- ggplot(incomes, aes(x=values, colour=factor(year)))
m <- m + scale_colour_brewer(palette="Set1",guide=FALSE)
##m <- m + scale_fill_brewer(palette="Set1",guide=FALSE)
m <- m + geom_density()
m <- m + facet_grid (.~year) 
m <- m + scale_x_continuous(breaks=seq(0,2000,200),labels= seq(0,2000,200)/100 )
m <- m + scale_y_continuous(breaks= seq(0,125,25)/100000, labels= seq(0,12.5,2.5))
m <- m + labs(x="Income [hundreds of dollars]", y="Density [% per $100]") + labs(title="SUNSHINE COAST'S EDUCATION NOMINAL INCOME: 2001,2006 & 2011")

ggsave("./Graphs/2-SCIncomeDensity.png", dpi=800)

sumstats<- data.frame(median=c(689,795,976),year=c(2001,2006,2011))
m<-  m + geom_vline(aes(xintercept = median), sumstats,linetype = "longdash")
labels <- data.frame(x = c(1200,1300,1500), y = rep(0.0009,3),year=c(2001,2006,2011),labs= c("Median = $ 689", "Median = $ 795","Median = $ 976"))
m<-  m + geom_text(aes(x, y, label=labs, group=NULL),data=labels, size=3) 

ggsave("./Graphs/3-SCMedianIncome.png", dpi=800)



