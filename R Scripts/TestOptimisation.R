setwd("~/Jandraor/Projects/Sunshine Coast/Data/Datasets/ABS/Births/2015-10-22")
births.data<- read.csv("SunCstASGS2011births.csv")
births<- births.data$Births

setwd("~/Jandraor/Projects/Sunshine Coast/Data/Datasets/ABS/Deaths/2015-10-22")
deaths.data<- read.csv("SunCstASGS2011deaths.csv")
deaths<- deaths.data$Deaths

setwd("~/Jandraor/Projects/Sunshine Coast/Data/Datasets/ABS/Qld Population/2015-10-22")
population.data         <- read.csv("SCPopulationASGS2014.csv")
actual                  <- population.data$Population
parameter.space         <- seq(0,0.05,0.0001)
squared.error           <- NULL
errors                  <- vector()

for (j in seq_along(parameter.space))
{
    net.migration.rate      <- parameter.space[j]
    temp                    <- actual[1]
    simulated               <- vector()
    net.migration           <- vector()
    simulated[1]            <- temp
    net.migration[1]        <- temp * net.migration.rate
    
    for(i in 2:14)
    {
        simulated[i]           <- temp + births[i-1] - deaths[i-1] + net.migration[i-1]
        net.migration[i]       <- simulated[i] * net.migration.rate
        temp                   <- simulated[i]
    }

    temp2                   <- sum((actual - simulated)^2)
    errors                  <- c(errors,temp2)
    
    if(is.null(squared.error))
    {
    squared.error           <- temp2
    the.parameter           <- net.migration.rate
    } else if (temp2<squared.error)
    {
        squared.error           <- temp2
        the.parameter           <- net.migration.rate  
    }


}