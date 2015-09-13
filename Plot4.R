#
# Code for Plot 4
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
voltage <- dfsub$Voltage
Global_reactive_power <- dfsub$Global_reactive_power
sub1 <- dfsub$Sub_metering_1
sub2 <- dfsub$Sub_metering_2
sub3 <- dfsub$Sub_metering_3

# create required plots
windows()

par(mfrow=c(2,2))

plot(datetime, gap, type="l", ylab = "Global Active Power", xlab = "")
plot(datetime, voltage, type="l")

plot(datetime, sub1, type="l", pch="", ylab="Energy sub metering", xlab="")
#lines(datetime, sub1, ylim=c(0,40), lwd=2.5, ,pch="", type="o")
lines(datetime, sub2, col="red", ylim=c(0,40), pch="", type="o")
lines(datetime, sub3, col="blue", ylim=c(0,40), pch="", type="o")

legend("topright", lty=c(1,1,1), col=c("black","red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(datetime, Global_reactive_power, type="l")
# copy the histogram to a PNG file
dev.copy(png, file = "Plot4.png")
dev.off()
