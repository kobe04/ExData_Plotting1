# Code to recreate plot1 from the first Course Project for the Coursera Course Exploratory Data
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


# Now, the plot can be created.

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(subdat$Global_active_power, col = "red", ylab = "Frequency",
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
