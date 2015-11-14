url<- "http://stat.abs.gov.au/FileView2.aspx?IDFile=069985c8-b2a3-4e4b-82f3-268d85e9062d"
date<- Sys.Date()
dir<- paste0("~/Jandraor/Projects/Sunshine Coast/Data/Datasets/ABS/Qld Population/",date)
if(!file.exists(dir)){dir.create(dir, recursive = TRUE)}
setwd(dir)

file<- paste0(dir,"/QldPopulationASGS2014",date,".gz")
download.file(url,destfile=file, mode="wb")
unzip(file, exdir=dir)

files <- list.files(pattern = "\\.csv$")
unnecessary.file<- files[grepl("Footnotes",files)]
file.remove(paste0(dir,"/",unnecessary.file))
data.file<- files[grepl("Data",files)]
file.rename(data.file,"QldPopulationASGS2014.csv")
file.remove(file)

