householddataFile <- "household_power_consumption.txt"
tbldata <- read.table(householddataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
tbldata$Date <- as.Date(tbldata$Date, format = "%d/%m/%Y") 
subSettedData <-tbldata[tbldata$Date >= "2007-02-01" & tbldata$Date <= "2007-02-02", ]
globalActivePower <- as.numeric(subSettedData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

