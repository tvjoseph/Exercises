## Setting the working directory
setwd("D:/R/")
## Reading the data from the working directory
NEI <- readRDS("summarySCC_PM25.rds")
## Reading the data from the working directory
SCC <- readRDS("Source_Classification_Code.rds")

NEI <- transform(NEI,year = factor(year))

boxplot(log(Emissions)~year,NEI,xlab = "Year",ylab = "log(PM2.5)")
dev.copy(png,file = "Assgn2-Plot1.png")
dev.off()

## Question 2

with(subset(NEI,fips=="24510"),boxplot(log(Emissions)~year,main = "Emission data for Baltimore",xlab = "Year",ylab = "log(PM 2.5)"))
dev.copy(png,file = "Assgn2-Plot2.png")
dev.off()

## Question 3

subNEI <- subset(NEI,fips =="24510")

g <- ggplot(subNEI,aes(year,log(Emissions)),)
g + geom_point() + geom_smooth(method = "lm") + facet_grid(.~ type)

## Question 4

mergedata <- merge(NEI,SCC,by.x = "SCC",by.y = "SCC",all=T)
Coalset <- mergedata[grep("Coal",mergedata$SCC.Level.Three),]
boxplot(log(Emissions)~year,Coalset)

## Question 5

motorvehicle <- mergedata[grep("motor vehicle",mergedata$EI.Sector Option.Group Option.Set),]





