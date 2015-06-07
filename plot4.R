setwd("C:\\users\\zhuangmg\\coursera\\exploratory data analysis\\project 1")
list.files()
data<-read.csv("./household_power_consumption.txt", sep=';',na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data2<-na.omit(data)
library(data.table)
fulldata<-data.table(data2)

## Subsetting data
subdata1<-fulldata[fulldata$Date=="1/2/2007"]
subdata2<-fulldata[fulldata$Date=="2/2/2007"]
subdatatotal<-rbind(subdata1,subdata2)

## Converting dates & power
datetime <- strptime(paste(subdatatotal$Date, subdatatotal$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subdatatotal$Global_active_power)
subdatatotal2<-data.table(subdatatotal,datetime,globalActivePower)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subdatatotal2, {
  plot(globalActivePower~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(globalActivePower~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()