## Plot 3
library(data.table)
library(graphics)
library(datasets)

## Cleanse the Data:
## Read Power Consumption, convert date and time to character before converting to format Date/Strptime
## subset in the date range
pd <- read.table('./data/household_power_consumption.txt', header=TRUE, sep=";", na="?")
pd$Date <- as.character(pd$Date)
pd$Time <- as.character(pd$Time)
pd$Time <- strptime(paste(pd$Date, pd$Time), "%d/%m/%Y %H:%M:%S")
pd$Date <- as.Date(pd$Date , "%d/%m/%Y")
pd <- subset(pd, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))


png(filename="plot3.png",width=480, height=480)

#Plot line for sub_metering
plot(pd$Time, pd$Sub_metering_1, 
     type="l",
     ylab="Energy sub metering",
     xlab=""
)
lines(pd$Time,pd$Sub_metering_2, type="l", col="red")
lines(pd$Time,pd$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       cex=0.8, 
       lty=1,
       col=c("black","red","blue"))
dev.off()

