## It is loaded the 'ggplot2' package. If it isn't installed, then it is done by this code
if(!require(ggplot2)){
    install.packages("ggplot2")
    library(ggplot2)
}

setwd("~/Jandraor/Projects/Sunshine Coast/Data/Sunshine Coast Area/Employment")
data<- read.csv("GrowthEmployment.IndustryQ.L2.csv")

g <- ggplot(data,aes(x=Year,y=Annual.growth*100))
g <- g + geom_point()
g <- g + geom_line()
g <- g + facet_grid(Data.type~Industry)
g <- g + scale_x_continuous(breaks=c(2002,2008,2014))
g <- g + labs(x="Years", y="Annual Growth [%/year]") 
g <- g + labs(title="JOB GROWTH IN HEALTH CARE & SOCIAL ASSISTANCE")
g <- g + geom_smooth(method="lm",se=FALSE)


print(g)
ggsave("~/Jandraor/Projects/Sunshine Coast/Graphs/EmploymentL2.growth.png",height = 7,width = 12, dpi=1500)