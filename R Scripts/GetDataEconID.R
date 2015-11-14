GetDataStructureID<-function(dataset,years){
   
    setwd("~/Jandraor/Projects/Sunshine Coast")
    date<-Sys.Date()
    dataset<- tolower(dataset)
    
    if(dataset=="valueadded")
    {
        
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/Value Added/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/value-add-by-industry/export/entity/7076?format=2&exid=5&sEndYear="
    }
    
    if(dataset=="employment")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/Employment/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/employment-by-industry/export/entity/7052?format=2&exid=1&sEndYear="
    }
    
    if(dataset=="fte")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/FTE/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/employment-by-industry-fte/export/entity/7079?format=2&exid=3&sEndYear="
    }
    if(dataset=="output")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/Output/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/output-by-industry/export/entity/7077?format=2&exid=7&sEndYear="
    }
    if(dataset=="localsales")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/Local Sales/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/local-sales-by-industry/export/entity/7078?format=2&exid=19&sEndYear="
    }
    if(dataset=="imports")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/Total Imports/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/imports-by-industry/export/entity/7084?format=2&exid=55&sEndYear="
    }
    if(dataset=="domesticimports")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/Domestic Imports/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/imports-by-industry/export/entity/7086?format=2&exid=17&imptype=2&sEndYear="
    } 
    if(dataset=="internationalimports")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/International Imports/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/imports-by-industry/export/entity/7085?format=2&exid=15&imptype=3&sEndYear="
    } 
    if(dataset=="exports")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/Total Exports/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/exports-by-industry/export/entity/7080?format=2&exid=53&sEndYear="
    }
    if(dataset=="domesticexports")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/Domestic Exports/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/exports-by-industry/export/entity/7082?format=2&exid=11&exptype=2&sEndYear="
    }
    if(dataset=="internationalexports")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/International Exports/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/exports-by-industry/export/entity/7081?format=2&exid=9&exptype=3&sEndYear="
    } 
    if(dataset=="workerproductivity")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/Worker Productivity/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/worker-productivity-by-industry/export/entity/7117?format=2&exid=21&sEndYear="
    }
    if(dataset=="workerhourproductivity")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/Worker Productivity Per Hour/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/worker-productivity-by-industry/export/entity/7151?format=2&exid=23&prodtype=2&sEndYear="
    }
    if(dataset=="businesses")
    {
        directory<-paste0("./Data/Sunshine Coast Area/Economy ID/Businesses/",as.character(date),"/")
        if(!file.exists(directory)){dir.create(directory, recursive = TRUE)}
        url<-"http://economy.id.com.au/sunshine-coast/number-of-businesses-by-industry/export/entity/7445?format=2&sEndYear="
    }
    
    for(i in seq_along(years))
    {
        fileurl<-paste0(url,years[i])
        download.file(fileurl,destfile=paste0(directory,years[i],".xls"),mode="wb")
    }
    print("Done!!!")
}
