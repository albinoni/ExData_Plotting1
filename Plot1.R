#
# Code for Plot 1
#

library(datasets)

# read in dataset 
file <- "household_power_consumption.txt"
df <- read.csv(file, sep = ";", na.strings="?")

# extract data for period 1/2/2007 00:00 to 2/2/2007 23:59
dfsub <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")

# create required histogram
windows()
hist(dfsub$Global_active_power,
     main="Global Active Power", 
     col="red",
     xlab="Global Active Power (kilowatts")

# copy the histogram to a PNG file
dev.copy(png, file = "Plot1.png")
dev.off()