## Reading data only for the spcified data range
#reading headers
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep=";")
#reading rows in the specified date range
data   <- read.table('household_power_consumption.txt', skip = 66637, nrows = 2880, header = FALSE, na.strings = c("?"), , sep=";")
colnames( data ) <- unlist(header)
data$Date = as.Date(data$Date, format = "%d/%m/%Y")

#comining the date and time
data <- transform(data, DayOfWeek =   as.POSIXct(paste(Date, Time)))

#creating the chart
with (data, plot(DayOfWeek, Sub_metering_1 , type="l",
     ylab="Energy sub metering", xlab = "" , col = "black"))

with( data, lines(DayOfWeek, Sub_metering_2 , col = "red"))
with( data, lines(DayOfWeek, Sub_metering_3 , col = "blue"))
legend ("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red", "blue"), lty=1, lwd =2)

#exporting PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()

