GetDataEconomyIDIndFocus<-function(comparison,years){
    
    date<-Sys.Date()
    comparison<- tolower(comparison)
    if(comparison=="qld")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Industry Focus/P - Education & Training/Qld Comparison/",as.character(date),"/") 
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<- "http://economy.id.com.au/sunshine-coast/industry-sector-analysis/export/entity/7311?format=2&sEndYear="
    }
        
    
    if(comparison=="seq")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Industry Focus/P - Education & Training/SEQ Comparison/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/industry-sector-analysis/export/entity/7311?format=2&BMID=30&sEndYear="
    }
    
    if(comparison=="aus")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Industry Focus/P - Education & Training/Australia Comparison/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/industry-sector-analysis/export/entity/7311?format=2&BMID=50&sEndYear="
    }
    
    for(i in seq_along(years))
    {
        fileurl<-paste0(url,years[i],"&IndkeyNieir=24500")
        download.file(fileurl,destfile=paste0(directory,years[i],".xls"),mode="wb")
    }
    print("Done!!!")
}