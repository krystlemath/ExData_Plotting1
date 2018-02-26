## read data in, do coversions and subsetting
consumptionData <- read.csv("household_power_consumption.txt", sep=";")
consumptionData$Date <- as.Date(consumptionData$Date, "%d/%m/%Y")
consumptionData_sub <- subset(consumptionData, (consumptionData$Date >= as.Date("2007-02-01") & consumptionData$Date <= as.Date("2007-02-02")))
consumptionData_sub$DateTime <- as.POSIXlt(paste(consumptionData_sub$Date, consumptionData_sub$Time))

## conversions required
consumptionData_sub$Global_active_power <- as.numeric(as.character(consumptionData_sub$Global_active_power))

## plotting
png("plot2.png", width=480, height=480, units="px")
plot(consumptionData_sub$DateTime, consumptionData_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()