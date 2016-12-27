plot1<-function(){


data <- readRDS("summarySCC_PM25.rds")

sumOfEmiisions<-tapply(data$Emissions,data$year,sum)

 png("plot1.png",width=480,height=480,units="px",bg="transparent")

 barplot(
    sumOfEmiisions,
       xlab="Year",
    ylab="PM2.5 Emissions in Tons",
    main="Total PM2.5 Emissions From All US Sources"
  )
 dev.off()
}