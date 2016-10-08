## Plot 1 
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

png(filename="plot1.png",width=480, height=480)
#Plot Histogram
hist(pd$Global_active_power, col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()

