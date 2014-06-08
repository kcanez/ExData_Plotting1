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

with(limitedConsData, plot(DateTime, Sub_metering_1))
with(limitedConsData, points(DateTime, Sub_metering_2, col = "blue"))
with(limitedConsData, points(DateTime, Sub_metering_3, col = "green"))

}