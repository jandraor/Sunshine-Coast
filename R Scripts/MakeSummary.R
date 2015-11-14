#MakeSummary(2001:2014, directory,"Value.Added")
#Add at the end of the directory address the character /
MakeSummary<-function(Years,Directory,Dataset.Name,LastYear=2014)
{
    ## It is loaded the 'xlsx' package. If it isn't installed, then it is done by this code
    if(!require(xlsx)){
        install.packages("xlsx")
        library(xlsx)
    }
    ## Code for sorting years
    Years<- sort(Years)
    ##
    LastYear.nf<- NULL
    name.files<- vector()
    for(i in seq(Years))
    {
        if(Years[i]==LastYear)
        {
            LastYear.nf<- paste0(LastYear,".xls")
            
        }else{
        temp <- paste0(Years[i],".xls")
        name.files<-c(name.files,temp)
        }
    }
    
    files         <- paste0(Directory,name.files)
    colIndex      <-1:7
    rowIndex      <-4:108
    df.List       <- lapply(files, read.xlsx,colIndex=colIndex,rowIndex=rowIndex, sheetIndex=1,stringsAsFactors=F, header=F)
    data          <- data.frame()
    summary.names <- vector()
    
    
    for(i in seq(length(files)))
    {
        Industries <-df.List[[i]][[1]]
        if(i==1)
        {
            summary       <- data.frame(Industries=Industries)   
        }
        YearStart     <- Years[i] - 1 
        YearEnd       <- Years[i]
        Values        <- df.List[[i]][[5]]
        tempDF        <- data.frame(Industries=Industries, Year.Start=YearStart,Year.End=YearEnd,Values=Values)
        tempDF2       <- data.frame(Values= Values)
        data          <- rbind(data,tempDF)
        summary       <- cbind.data.frame(summary,tempDF2)
        tempname      <- paste0(YearStart,"/",YearEnd)
        summary.names <- c(summary.names,tempname)
    }
    
    if(!is.null(LastYear.nf))
    {
        LastYear.file <- paste0(Directory,LastYear.nf)
        df.LastYear   <- read.xlsx(LastYear.file,colIndex=colIndex,rowIndex=rowIndex,sheetIndex = 1, stringAsFactors=F, header=F)
        Industries    <- df.LastYear[[1]]
        YearStart     <- LastYear-1
        YearEnd       <- LastYear
        Values        <- df.LastYear[[2]]
        tempDF        <- data.frame(Industries=Industries, Year.Start=YearStart,Year.End=YearEnd,Values=Values)
        tempDF2       <- data.frame(Values= Values)
        data          <- rbind(data,tempDF)
        summary       <- cbind.data.frame(summary,tempDF2)
        tempname      <- paste0(YearStart,"/",YearEnd)
        summary.names <- c(summary.names,tempname)
    }
    
    colnames(summary) <- c("Industries",summary.names)
    write.csv(summary,paste0(Directory,"Summary.csv"),row.names=F)
    
    ## In this part the column of 'Classification' is created-----------------
    data.div  <-read.csv("~/Jandraor/Projects/Sunshine Coast/Data/Datasets/ABS/ANZSIC/Divisions.csv", stringsAsFactors=F)
    data.sdiv <-read.csv("~/Jandraor/Projects/Sunshine Coast/Data/Datasets/ABS/ANZSIC/SubdivisionsID.csv", stringsAsFactors=F)
    Divisions<- data.div[[2]]
    Subdivisions<- data.sdiv[[2]]
    nrows             <- nrow(data)
    data$Classification<- ""
    for(i in seq(nrows))
    {
        if(data[[1]][[i]] %in% Divisions)
        {
            data[[5]][[i]]<- "Division"
        }
        if(data[[1]][[i]] %in% Subdivisions)
        {
            data[[5]][[i]]<- "Subdivision"
        }
    }
    #--------------------------------------------------------------------------
    colnames(data)    <- c("Industries","Year.Start","Year.End",Dataset.Name,"Classification")
    write.csv(data,paste0(Directory,"TidyData.csv"), row.names=F)
    
}