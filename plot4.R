## read data in, do coversions and subsetting
consumptionData <- read.csv("household_power_consumption.txt", sep=";")
consumptionData$Date <- as.Date(consumptionData$Date, "%d/%m/%Y")
consumptionData_sub <- subset(consumptionData, (consumptionData$Date >= as.Date("2007-02-01") & consumptionData$Date <= as.Date("2007-02-02")))
consumptionData_sub$DateTime <- as.POSIXlt(paste(consumptionData_sub$Date, consumptionData_sub$Time))

## conversions
consumptionData_sub$Global_active_power <- as.numeric(as.character(consumptionData_sub$Global_active_power))
consumptionData_sub$Voltage <- as.numeric(as.character(consumptionData_sub$Voltage))
consumptionData_sub$Global_reactive_power <- as.numeric(as.character(consumptionData_sub$Global_reactive_power))
consumptionData_sub$Sub_metering_1 <- as.numeric(as.character(consumptionData_sub$Sub_metering_1))
consumptionData_sub$Sub_metering_2 <- as.numeric(as.character(consumptionData_sub$Sub_metering_2))

## plotting
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

## Global Active Power
plot(consumptionData_sub$DateTime, consumptionData_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## Voltage
plot(consumptionData_sub$DateTime, consumptionData_sub$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Energy sub metering
plot(consumptionData_sub$DateTime, consumptionData_sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(consumptionData_sub$DateTime, consumptionData_sub$Sub_metering_2, col="red")
lines(consumptionData_sub$DateTime, consumptionData_sub$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

## Global reactive power
plot(consumptionData_sub$DateTime, consumptionData_sub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
par(mfrow=c(1,1))