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


# CREATING PLOT #3

# Set up graphics device
png("plot3.png", width=480, height=480, units="px")

# Plot Sub_metering_1 over time
plot(dateTime, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))

# Add a red line for Sub_metering_2
lines(dateTime, as.numeric(as.character(Sub_metering_2)), col="red")

# Add a blue line for Sub_metering_3
lines(dateTime, as.numeric(as.character(Sub_metering_3)), col="blue")

# Add a legend
legend("topright", lty=1, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the device
dev.off()