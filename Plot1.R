library(tidyr)
library(data.table)
hpc <- read.table("hpc.txt",header = TRUE,sep=";",stringsAsFactors = FALSE)

hpc_sub <- subset(hpc,hpc$Date == "1/2/2007"|hpc$Date=="2/2/2007")

#Plotting the first graph - Histogram of Global Active Power
png("plot.png",width = 480, height = 480)
GAP <- as.numeric(hpc_sub$Global_active_power)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

