url<- "http://www.abs.gov.au/ausstats/subscriber.nsf/log?openagent&33020do006_2013.xls&3302.0&Data%20Cubes&329B9F4BABF1B33ECA257D87000C980B&0&2013&06.11.2014&Latest"
date<- Sys.Date()
dir<- paste0("~/Jandraor/Projects/Sunshine Coast/Data/Datasets/ABS/Deaths/",date)
if(!file.exists(dir)){dir.create(dir, recursive = TRUE)}
setwd(dir)
file<- paste0(dir,"/DeathsASGS2011.xls")
download.file(url,destfile=file, mode="wb")