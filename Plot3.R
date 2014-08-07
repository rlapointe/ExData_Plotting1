# Note: for all scripts I'm assuming the data has already been downloaded,
# unzipped, and placed in a data folder locally. This is in line with the assignment.

## Read in data
setwd("~/Documents/Helpful Docs/Coursera/ExploratoryDataAnalysis")
power_data = read.csv2("./data/household_power_consumption.txt", )

# Cut down data to 2007-02-01 and 2007-02-02
power_data$Date = as.Date(power_data$Date, format = '%d/%m/%Y')
power_data_cut_down = power_data[power_data$Date >= as.Date('2007-02-01') & power_data$Date <= as.Date('2007-02-02'),]

# Make a datetime field for use in plotting
power_data_cut_down$DateTime = paste(power_data_cut_down$Date, power_data_cut_down$Time)
power_data_cut_down$DateTime = strptime(power_data_cut_down$DateTime, format = '%Y-%m-%d %H:%M:%S')

# Transform the value fields into numeric for plotting
power_data_cut_down$Sub_metering_1 = as.numeric(as.character(power_data_cut_down$Sub_metering_1))
power_data_cut_down$Sub_metering_2 = as.numeric(as.character(power_data_cut_down$Sub_metering_2))
power_data_cut_down$Sub_metering_3 = as.numeric(as.character(power_data_cut_down$Sub_metering_3))

# Plot the data to PNG format
png(file = "plot3.png")
plot(power_data_cut_down$DateTime, power_data_cut_down$Sub_metering_1,
     ylab = "Energy sub metering", xlab = "",
     main = "", type="l")
lines(power_data_cut_down$DateTime, power_data_cut_down$Sub_metering_2, col = 'red')
lines(power_data_cut_down$DateTime, power_data_cut_down$Sub_metering_3, col = 'blue')
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()