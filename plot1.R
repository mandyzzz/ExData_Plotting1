setwd("C:\\users\\zhuangmg\\coursera\\exploratory data analysis\\project 1")
list.files()
data<-read.csv("./household_power_consumption.txt", sep=';',na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
library(data.table)
fulldata<-data.table(data)

## Subsetting data
subdata1<-fulldata[fulldata$Date=="1/2/2007"]
subdata2<-fulldata[fulldata$Date=="2/2/2007"]
subdatatotal<-rbind(subdata1,subdata2)

## Plot 1
hist(subdatatotal$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()