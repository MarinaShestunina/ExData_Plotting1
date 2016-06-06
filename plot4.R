png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
filteredData<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
with(filteredData, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), as.numeric(Global_active_power), xlab="", ylab="Global Active Power (kilowatts)", type="l"))

with(filteredData, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), as.numeric(Voltage), xlab="datetime", ylab="Voltage", type="l"))

dates<-strptime(paste(filteredData$Date, filteredData$Time), "%d/%m/%Y %H:%M:%S")
plot(dates, filteredData$Sub_metering_1, xlab="", ylab="Energy sub metering",type="n")
lines(dates, filteredData$Sub_metering_1, type="l")
lines(dates, filteredData$Sub_metering_2, type="l", col="red")
lines(dates, filteredData$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

with(filteredData, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_reactive_power, xlab="datetime", type="l"))
dev.off()