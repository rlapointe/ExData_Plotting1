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
power_data_cut_down$Global_active_power = as.numeric(as.character(power_data_cut_down$Global_active_power))

# Plot the data to PNG format
png(file = "plot1.png")
hist(power_data_cut_down$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     main = "Global Active Power", border = "black")
dev.off()