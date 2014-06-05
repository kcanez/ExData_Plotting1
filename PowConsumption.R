consData <- read.csv2("household_power_consumption.txt")
consData$DateTime <- apply(consData[,c("Date", "Time")], 1, paste, collapse = " ")
consDataTest <- consData
consDataTest <- consDataTest[ , !( names( consDataTest ) %in% c("Date", "Time") ) ]
x <- strptime(x=consDataTest[,8], format="%d/%m/%Y %H:%M:%S")
consDataTest$DateTime <- x
consDataTest$Global_active_power <- as.numeric(consDataTest$Global_active_power)
limitedConsData <- subset(consDataTest, subset = DateTime < as.POSIXct("2007-2-2") & DateTime > as.POSIXct("2007-2-1"))
hist(limitedConsData$Global_active_power, col = "red")