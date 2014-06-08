plot3 <- function()
{
consData <- read.csv2("household_power_consumption.txt")
consData$DateTime <- apply(consData[,c("Date", "Time")], 1, paste, collapse = " ")
consData <- consData[ , !( names( consData ) %in% c("Date", "Time") ) ]
x <- strptime(x=consData$DateTime, format="%d/%m/%Y %H:%M:%S")
consData$DateTime <- x

limitedConsData <- subset(consData, subset = DateTime < as.POSIXct("2007-2-3") & DateTime >= as.POSIXct("2007-2-1"))

limitedConsData$Sub_metering_1 <- as.numeric(as.character(limitedConsData$Sub_metering_1))
limitedConsData$Sub_metering_2 <- as.numeric(as.character(limitedConsData$Sub_metering_2))
limitedConsData$Sub_metering_3 <- as.numeric(as.character(limitedConsData$Sub_metering_3))


png(filename="plot3.png", width=480, height=480)
with(limitedConsData, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "energy sub metering"))
with(limitedConsData, points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(limitedConsData, points(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", pch = "_____", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 1.1)
dev.off()

}