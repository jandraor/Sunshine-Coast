PrepareHistogram<- function(dataset)
{
    midval <- sapply(strsplit(dataset[[1]],"-"),function(x) mean(as.numeric(x)))
    breakval <- strsplit(dataset[[1]],"-")
    breakval <- as.numeric(c(sapply(breakval,head,1),tail(unlist(breakval),1)))
    values<-rep(midval,as.numeric(dataset[[2]]))
    result<-list(values=values,breakval=breakval)
    return(result)
}
#h1<-hist((datah1$values),breaks=datah1$breakval, main="Hola Perro",prob=TRUE, yaxt="n")
#axis(2, at=c(0,0.0001,0.0002,0.0003,0.0004,0.0005,0.0006,0.0007,0.0008), labels=c(0,1,2,3,4,5,6,7,8))