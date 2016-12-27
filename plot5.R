plot5<-function(){


	

  	data <- readRDS("summarySCC_PM25.rds")

	
	motorData  <-motorSrc<- data[data$type=="ON-ROAD",]
	
	baltimoreEmission<-motorData[motorData$fips=="24510",]

	totalemissions<- aggregate(Emissions ~ year, baltimoreEmission, sum)

	library(ggplot2)
	png("plot5.png",width=640,height=480,units="px",bg="transparent")

	ggplot <- ggplot(totalemissions,aes(factor(year),Emissions)) +
  	geom_bar(stat="identity") +
  	guides(fill=FALSE)+
 	
  	labs(x="year", y=expression("Total PM 2.5 Emission inBaltimore City By Motor Vehciles Sources "))
	print(ggplot)
	dev.off()
}