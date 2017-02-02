library(tidyr)
library(data.table)
hpc <- read.table("hpc.txt",header = TRUE,sep=";",stringsAsFactors = FALSE)

hpc_sub <- subset(hpc,hpc$Date == "1/2/2007"|hpc$Date=="2/2/2007")

#Plotting the second graph - Global Active Power vs DateTime

GAP <- as.numeric(hpc_sub$Global_active_power)
Timeseries <- strptime(paste(hpc_sub$Date, hpc_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png",width = 480, height = 480)
plot(Timeseries,GAP,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()