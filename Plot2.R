#
# Code for Plot 2
#

library(datasets)

# read in dataset 
file <- "household_power_consumption.txt"
df <- read.csv(file, sep = ";", na.strings="?")

# extract data for period 1/2/2007 00:00 to 2/2/2007 23:59
dfsub <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")

# capture date and time variables to create a datetime
datetime <- strptime(paste(dfsub$Date, dfsub$Time),"%d/%m/%Y %H:%M:%S")

# capture data for global active power.
gap <- dfsub$Global_active_power

# create required plot
windows()
plot(datetime, gap, type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
     
# copy the plot to a PNG file
dev.copy(png, file = "Plot2.png")
dev.off()