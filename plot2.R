# Code to recreate plot2 from the first Course Project for the Coursera Course Exploratory Data
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

png(filename = "plot2.png", width = 480, height = 480, units = "px")

with(subdat, plot(datetime, Global_active_power, type = "l", xlab = "",
                  ylab = "Global Active Power (kilowatts)"))

dev.off()
