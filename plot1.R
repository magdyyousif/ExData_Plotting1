## Reading data only for the spcified data range
#reading headers
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep=";")
#reading rows in the specified date range
data   <- read.table('household_power_consumption.txt', skip = 66637, nrows = 2880, header = FALSE, na.strings = c("?"), , sep=";")
colnames( data ) <- unlist(header)
data$Date = as.Date(data$Date, format = "%d/%m/%Y")

#creating the chart
hist(data$Global_active_power, xlab = "Global Active Power (koliwatts)", main = "Global Active Power", col = "red")

#exporting PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()