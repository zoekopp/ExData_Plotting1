# INITIAL SETUP

# Change working directory
setwd("ExploratoryDataAnalysis")

# Download and read in data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile="household_power_consumption.zip", method="curl")
powerData <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";")
# Subset data for household power consumption Feb 1st-2nd, 2007 only
powerDataSubset <- powerData[as.character(powerData$Date) %in% c("1/2/2007", "2/2/2007"),]

# Concatenate Date and Time variables
powerDataSubset$dateTime <- paste(powerDataSubset$Date, powerDataSubset$Time)
# Convert to Date/Time class using strptime
powerDataSubset$dateTime <- strptime(powerDataSubset$dateTime, "%d/%m/%Y %H:%M:%S")


# CREATING PLOT #4

# Set up graphics device and margins
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

# Top left
plot(dateTime, as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power")

# Top right
plot(dateTime, as.numeric(as.character(Voltage)), type="l", xlab="datetime", ylab="Voltage")

# Bottom left
plot(dateTime, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(dateTime, as.numeric(as.character(Sub_metering_2)), col="red")
lines(dateTime, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom right
plot(dateTime, as.numeric(as.character(Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")

# Close the device
dev.off()