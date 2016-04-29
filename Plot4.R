householddataFile <- "household_power_consumption.txt"
tbldata <- read.table(householddataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSettedData <-tbldata[tbldata$Date  %in% c("1/2/2007","2/2/2007") , ]
filteredDateTime <- strptime(paste(subSettedData$Date, subSettedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSettedData$Global_active_power)
Sub_metering_1 <- as.numeric(subSettedData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSettedData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSettedData$Sub_metering_3)
powervoltage <- as.numeric(subSettedData$Voltage)
global_reactive_power <- as.numeric(subSettedData$Global_reactive_power)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(filteredDateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.3)
plot(filteredDateTime, powervoltage, type="l", xlab="datetime", ylab="Voltage")
plot(filteredDateTime, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(filteredDateTime, Sub_metering_2, type="l", col="red")
lines(filteredDateTime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(filteredDateTime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()