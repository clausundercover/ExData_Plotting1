library(readr)
library(dplyr)
library(graphics)


## import section - uncomment if we are also importing the data.
d <- read_delim("household_power_consumption.txt", delim=";", n_max=2100000, col_types="ctddddddd")
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d <- subset(d, d$Date >= as.Date('2007-02-01') & d$Date <= as.Date('2007-02-02'))

#produce graph
png("plot1.png")
hist(d$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#close graph
dev.off()