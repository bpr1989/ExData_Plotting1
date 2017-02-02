library(tidyr)
library(data.table)
hpc <- read.table("hpc.txt",header = TRUE,sep=";",stringsAsFactors = FALSE)

hpc_sub <- subset(hpc,hpc$Date == "1/2/2007"|hpc$Date=="2/2/2007")

#Plotting the third graph - combination of may plots

GAP <- as.numeric(hpc_sub$Global_active_power)
GAR <- as.numeric(hpc_sub$Global_reactive_power)
Voltage <- as.numeric(hpc_sub$Voltage)
SM1 <- as.numeric(hpc_sub$Sub_metering_1)
SM2 <- as.numeric(hpc_sub$Sub_metering_2)
SM3 <- as.numeric(hpc_sub$Sub_metering_3)

Timeseries <- strptime(paste(hpc_sub$Date, hpc_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png",width = 480, height = 480)
par(mfrow =c(2,2))
plot(Timeseries,GAP,xlab="",ylab="Global Active Power (kilowatts)",type="l")
plot(Timeseries, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(Timeseries,SM1,xlab="",ylab="Energy sub metering",type="l")
lines(Timeseries,SM2,col="red",type="l")
lines(Timeseries,SM3,col="blue",type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(Timeseries,GAR,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()