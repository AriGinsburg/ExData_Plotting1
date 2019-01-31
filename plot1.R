
library(dplyr)
library(lubridate)
library(magrittr)

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date %<>% dmy()
data %<>% filter(Date %in% ymd(c('2007-02-01','2007-02-02')))

png("plot1.png")
hist(data$Global_active_power
     ,col = "red"
     ,main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)")
dev.off()
