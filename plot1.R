plot1 <- function()
{ 
  options(warn=-1)  #Seeing the warning message got annoying
  
  consData <- read.csv2("household_power_consumption.txt")
  consData$DateTime <- apply(consData[,c("Date", "Time")], 1, paste, collapse = " ")
  consData <- consData[ , !( names( consData ) %in% c("Date", "Time") ) ]
  x <- strptime(x=consData$DateTime, format="%d/%m/%Y %H:%M:%S")
  consData$DateTime <- x
  consData$Global_active_power <- as.numeric(as.character(consData$Global_active_power))
  
  limitedConsData <- subset(consData, subset = DateTime < as.POSIXct("2007-2-3") & DateTime >= as.POSIXct("2007-2-1"))
  
  png(filename="plot1.png", width=480, height=480)
  hist(limitedConsData$Global_active_power, col = "red", breaks = 12, xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()

}
