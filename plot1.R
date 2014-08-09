# Create plot

# Script does the following:
# 1. Loads the data
# 2. Adds columns for dates and date times
# 3. Cull data for the correct period
# 4. Create respective graph

# Load, enhance and cull data
setwd("C:\\Users\\France\\Coursera\\data\\rprog-data-4_1_Project1")
PD <- read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")
PD$conv_date = as.Date(PD$Date,format='%d/%m/%Y')
PD$conv_time = strptime(paste(PD$conv_date, PD$Time), format = '%Y-%m-%d %H:%M:%S')
PD_rel = PD[(PD$conv_date >= as.Date('2007-02-01',format='%Y-%m-%d') & PD$conv_date <= as.Date('2007-02-02',format='%Y-%m-%d')), ]

# create plot to file
png(file = 'plot1.png')
hist(PD_rel$Global_active_power, col='Red', xlab ='Global_active_power (kilowatts)', main ='Global Active Power')
dev.off()