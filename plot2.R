
library(dplyr)
library(lubridate)
library(magrittr)

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$datetime <-dmy_hms(paste(data$Date,data$Time))
data$Date %<>% dmy()
data %<>% filter(Date %in% ymd(c('2007-02-01','2007-02-02')))

png("plot2.png")
plot(data$datetime,data$Global_active_power
     ,type = "l"
     ,ylab="Global Active Power (kilowatts)"
     ,xlab="")
dev.off()
