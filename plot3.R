library(readr)
library(dplyr)
library(graphics)

Sys.setenv(TZ='GMT')

## import section - uncomment if we are also importing the data.
d <- read_delim("household_power_consumption.txt", delim=";", n_max=2100000, col_types="ctddddddd")
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d <- subset(d, d$Date >= as.Date('2007-02-01') & d$Date <= as.Date('2007-02-02'))

d$dt <- as.POSIXct(d$Date) + d$Time
#produce graph
png("plot3.png")
#with(d, plot(dt, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))
plot(d$dt, d$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(d$dt, d$Sub_metering_2, type="l", col="red")
points(d$dt, d$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)

#close graph
dev.off()