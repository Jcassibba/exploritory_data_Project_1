dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep = "", rm.na=TRUE), "%d/%m/%y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower,type = "b", xlab="", ylab ="Global Active Power (Killowatts)", 
     xlim=c(0,+20), ylim = c(0,+5000))
dev.off()
