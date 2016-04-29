householddataFile <- "household_power_consumption.txt"
tbldata <- read.table(householddataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSettedData <-tbldata[tbldata$Date  %in% c("1/2/2007","2/2/2007") , ]
datetime <- strptime(paste(subSettedData$Date, subSettedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSettedData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
