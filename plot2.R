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
with (data, plot(DayOfWeek, Global_active_power , type="l",
     ylab="Global Active Power (kilowatts)", xlab = "" ))

#exporting PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

