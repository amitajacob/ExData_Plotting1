householddataFile <- "household_power_consumption.txt"
tbldata <- read.table(householddataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSettedData <-tbldata[tbldata$Date  %in% c("1/2/2007","2/2/2007") , ]
filteredDateTime <- strptime(paste(subSettedData$Date, subSettedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSettedData$Global_active_power)
Sub_metering_1 <- as.numeric(subSettedData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSettedData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSettedData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(filteredDateTime, Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
lines(filteredDateTime, Sub_metering_2, type="l", col="red")
lines(filteredDateTime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()