
library(dplyr)
library(lubridate)
library(magrittr)

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$datetime <-dmy_hms(paste(data$Date,data$Time))
data$Date %<>% dmy()
data %<>% filter(Date %in% ymd(c('2007-02-01','2007-02-02')))

png("plot4.png")
par(mfrow=c(2,2))
plot(data$datetime,data$Global_active_power
     ,type = "l"
     ,ylab="Global Active Power (kilowatts)"
     ,xlab="")

plot(data$datetime
     ,data$Voltage
     ,type='l'
     ,ylab="Voltage"
     ,xlab="datetime")

plot(data$datetime,data$Sub_metering_1
     ,type = "l"
     ,ylab="Energy sub metering"
     ,xlab="")
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright"
       ,legend=c("Sub_metering_1"
                 ,"Sub_metering_2"
                 ,"Sub_metering_3")
       ,col=c("black"
              ,"red",
              "blue")
       ,lty=1
       ,bty="n")

plot(data$datetime
     ,data$Global_reactive_power
     ,type="l"
     ,xlab='datetime'
     ,ylab='Global_reactive_power')
dev.off()
