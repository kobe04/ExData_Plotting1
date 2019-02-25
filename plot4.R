# Code to recreate plot4 from the first Course Project for the Coursera Course Exploratory Data
#   Analysis.

# The code starts with downloading the data. You can skip this step if you've already done this.

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "Electric Power Consumption.zip")

unzip("Electric Power Consumption.zip")


# Then the code reads the data into R. Then it is subsetted to the date-parameters given in the
#   Assignment.

dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
subdat <- dat[(dat$Date == "2007-02-01" | dat$Date == "2007-02-02"),]
rm(dat)

subdat <- cbind(strptime(paste(subdat[,1], subdat[,2]), format='%Y-%m-%d %H:%M:%S'), subdat[,3:9])
names(subdat)[1] <- "datetime"


# Now, the plot can be created

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2))
# First part
with(subdat, plot(datetime, Global_active_power, type = "l", xlab = "",
                  ylab = "Global Active Power"))

# Second part
with(subdat, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(subdat, lines(datetime, Sub_metering_1, type = "l", col = "black"))
with(subdat, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(subdat, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Third part
with(subdat, plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# Fourth part
with(subdat, plot(datetime, Global_reactive_power, type = "l", xlab = "datetime",
                  ylab = "Global_reactive_power"))

dev.off()