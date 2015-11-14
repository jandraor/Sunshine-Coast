valueadded<- read.csv("./Data/ValueAddedPerRegion.csv")
g<- ggplot(valueadded,aes(Year.End,AnnualGrowth))
g<- g + facet_grid(GeoLocation~.)+ geom_point() + geom_line(color="steelblue") + geom_smooth(se=FALSE, method="lm", color="red") + scale_x_continuous(breaks = seq(min(valueadded$Year.End), max(valueadded$Year.End), by = 1)) 
g<- g + labs(x="Year", y="Growth[%]") + labs(title="Edu & Trg Value Added Annual Growth")
