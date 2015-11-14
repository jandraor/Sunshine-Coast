url<- "http://www.abs.gov.au/ausstats/subscriber.nsf/log?openagent&33010do004_2013.xls&3301.0&Data%20Cubes&E1AEC94F79BB08A9CA257D7900105243&0&2013&23.10.2014&Latest"
date<- Sys.Date()
dir<- paste0("~/Jandraor/Projects/Sunshine Coast/Data/Datasets/ABS/Births/",date)
if(!file.exists(dir)){dir.create(dir, recursive = TRUE)}
setwd(dir)
file<- paste0(dir,"/BirthsASGS2011.xls")
download.file(url,destfile=file, mode="wb")