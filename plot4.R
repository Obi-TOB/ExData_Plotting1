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
Sys.setlocale("LC_TIME", "English")

# create grip for graphs
png(file = 'plot4.png')
par(mfcol= c(2,2))

# create 1st graph
plot(PD_rel$conv_time,PD_rel$Global_active_power, type = "l", ylab ='Global Active Power', xlab='')

# create second graph
plot(PD_rel$conv_time,PD_rel$Sub_metering_1, type = 'n', ylab ='Energy sub metering',xlab='')
lines(PD_rel$conv_time,PD_rel$Sub_metering_1)
lines(PD_rel$conv_time,PD_rel$Sub_metering_2, col ='Red')
lines(PD_rel$conv_time,PD_rel$Sub_metering_3, col = 'Blue')
legend("topright",lty = "solid", col = c("Black","Red", "Blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

# create third graph
plot(PD_rel$conv_time,PD_rel$Voltage, type = "l", ylab ='Voltage', xlab='datetime')

# create fourh graph
plot(PD_rel$conv_time,PD_rel$Global_reactive_power, type = "l", ylab ='Global_reactive_power', xlab='datetime')
dev.off()
