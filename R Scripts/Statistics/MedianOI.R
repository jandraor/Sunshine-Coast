MedianOI<- function(dataset,totaldata)
{
    cols           <- grep("Interval|Frequency", colnames(dataset))
    data           <- dataset[,cols]
    data$Interval  <- as.character(data$Interval)
    midpoint       <- totaldata/2
    rows           <- nrow(data)
    CumFreq        <- 0
    for(i in seq(rows) )
    {
        CumFreq  <- as.numeric(data$Frequency[i]) + CumFreq
        print(CumFreq)
        if(CumFreq>= midpoint)
        {
            MedianIndex <- i
            CF.b <- CumFreq - as.numeric(data$Frequency[i])
            break
        }
    }
    MedianInterval <- strsplit(data$Interval[MedianIndex],"-")
    L              <- as.numeric(MedianInterval[[1]][1])
    w              <- as.numeric(MedianInterval[[1]][2])-as.numeric(MedianInterval[[1]][1])
    Freq.mg        <- as.numeric(data$Frequency[MedianIndex])
    Median         <- L + (((midpoint - CF.b)/Freq.mg)*w)
    return(Median)
}