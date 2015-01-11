plot4 <- function()
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
  limitedConsData$Voltage <- as.numeric(as.character(limitedConsData$Voltage))
  limitedConsData$Global_reactive_power <- as.numeric(as.character(limitedConsData$Global_reactive_power))
  limitedConsData$Global_active_power <- as.numeric(as.character(limitedConsData$Global_active_power))

png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(limitedConsData, {plot(y=limitedConsData$Global_active_power,x=limitedConsData$DateTime, xlab = "", ylab = "Global Active Power", type = "l")
                           plot(x = limitedConsData$DateTime, y = limitedConsData$Voltage, ylab = "voltage", xlab = "datetime", type = "l")
                           with(limitedConsData, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "energy sub metering"))
with(limitedConsData, points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(limitedConsData, points(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", pch = "_____", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .4)
plot(x = limitedConsData$DateTime, y = limitedConsData$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")})
dev.off()
}
