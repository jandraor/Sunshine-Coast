## It is loaded the 'ggplot2' package. If it isn't installed, then it is done by this code
if(!require(ggplot2)){
    install.packages("ggplot2")
    library(ggplot2)
}

setwd("~/Jandraor/Projects/Sunshine Coast/Data/Sunshine Coast Area/Economy ID/Value Added/2015-09-15")

data<- read.csv("TidyData.csv")
construction.data<- data[grep("Construction",as.character(data$Industries)),]
industries<- unique(construction.data$Industries)
names<- c("Construction", "Bldg Construction", "HCE Construction", "Construction Svcs")
short.names<- data.frame(Industries=industries, short.name=names)
construction.data<-merge(construction.data,short.names, by="Industries")
construction.data$short.name <- factor(construction.data$short.name,levels = (names))

g<- ggplot(construction.data,aes(Year.End,Value.Added))
g<- g + geom_line()
g<- g + geom_point()
g<- g + facet_grid(short.name~.)
g <-g + scale_x_continuous(breaks=(2001:2014),labels= c(2001:2014))
g<- g + labs(x="Years", y="Value add [$m]")
g<- g + labs(title="CONSTRUCTION VALUE ADD 2001-2014")
print(g)
ggsave("~/Jandraor/Projects/Sunshine Coast/Graphs/ConstructionVA.png", dpi=800)
