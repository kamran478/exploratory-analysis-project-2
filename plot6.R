plot6<-function(){


	

  	data <- readRDS("summarySCC_PM25.rds")

	
	motorData  <-motorSrc<- data[data$type=="ON-ROAD",]
	
	baltimoreEmission<-motorData[motorData$fips=="24510",]

	
	totalBaltimoreEm<- aggregate(Emissions ~ year, baltimoreEmission, sum)

	totalBaltimoreEm$city<-with(totalBaltimoreEm,"Baltimore City")


	LAEmission<-motorData[motorData$fips=="06037",]


	totalLAEm<- aggregate(Emissions ~ year, LAEmission, sum)

	totalLAEm$city<-with(totalLAEm,"Los Angeles County")


	meregedData<-rbind(totalLAEm,totalBaltimoreEm)

	library(ggplot2)
	png("plot6.png",width=640,height=480,units="px",bg="transparent")


	ggplot <- ggplot(meregedData,aes(year,Emissions)) +
  	geom_line(aes(colour=city)) +
  	
 	
  	labs(x="year", y=expression("Total PM 2.5 Emission inBaltimore City By Motor Vehciles Sources "))
	print(ggplot)
	dev.off()
}