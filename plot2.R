 plot2<-function(){
 
 
 data <- readRDS("summarySCC_PM25.rds")
 subset<-data[data$fips=="24510",]
 sumOfEmiisions<-tapply(subset$Emissions,subset$year,sum)
  
 png("plot2.png",width=480,height=480,units="px",bg="transparent")
  barplot(
    sumOfEmiisions,
       xlab="Year",
    ylab="PM2.5 Emissions in Tons",
    main="Total PM2.5 Emissions In Baltimore"
  )
 dev.off()
 }
