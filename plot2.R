png(filename = "plot2.png", width = 480, height = 480)
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
filteredData<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
with(filteredData, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), as.numeric(Global_active_power), xlab="", ylab="Global Active Power (kilowatts)", type="l"))
dev.off()