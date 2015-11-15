MeanOI<- function(dataset,OI.Mark,OI.Freq)
{
    cols           <- grep("Interval|Frequency", colnames(dataset))
    data           <- dataset[,cols]
    data$Interval  <- as.character(data$Interval)
    rows           <- nrow(data)
    counter        <- 0
    adder          <- 0     
    
    for(i in seq(rows))
    {
        aux           <- strsplit(data$Interval[i],"-")
        mark          <- (as.numeric(aux[[1]][2])+as.numeric(aux[[1]][1]))/2
        adder         <- adder + (mark * data$Frequency[i]) 
        counter       <- counter + data$Frequency[i]
    }
    counter        <- counter + OI.Freq
    adder          <- adder + (OI.Mark*OI.Freq)
    Mean           <- adder/counter    
    return(Mean)
}