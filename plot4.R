plot4<-function(){


	
	if(!exists("data ")){
  		data <- readRDS("summarySCC_PM25.rds")
	}

	if(!exists("scc ")){
  		scc <- readRDS("Source_Classification_Code.rds")
	}
	# merge the two data sets 

	if(!exists("mergeddata")){
  		mergeddata<-merge(data,scc,by="SCC")

	}

	
	coalSrc  <- grepl("coal", mergeddata$Short.Name, ignore.case=TRUE)
	
	coalData <- mergeddata[coalSrc,]

	totalemissions<- aggregate(Emissions ~ year, coalData , sum)

	library(ggplot2)
	png("plot4.png",width=640,height=480,units="px",bg="transparent")

	ggplot <- ggplot(totalemissions,aes(factor(year),Emissions)) +
  	geom_bar(stat="identity") +
  	guides(fill=FALSE)+
 	
  	labs(x="year", y=expression("Total PM 2.5 Emission (Coal Sources)"))
	print(ggplot)
	dev.off()
}