valueadded<- read.csv("./Data/ValueAddedPerRegion.csv")
g<- ggplot(valueadded,aes(Year.End,ValueAdded))
g<- g + facet_grid(GeoLocation~.)+ geom_point() + geom_line(color="steelblue") + scale_x_continuous(breaks = seq(min(valueadded$Year.End), max(valueadded$Year.End), by = 1)) 
g<- g + labs(x="Year", y="Value Added [$ millions]") + labs(title="Edu & Trg Value Added")