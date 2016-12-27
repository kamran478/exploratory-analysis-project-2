plot3<-function(){


data <- readRDS("summarySCC_PM25.rds")

subset<-data[data$fips=="24510",]


 png("plot3.png",width=480,height=480,units="px",bg="transparent")

ggplot <- ggplot(subset,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM 2.5 Emission (Tons)"))
print(ggplot)
 dev.off()
}