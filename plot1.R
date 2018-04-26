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

# CREATING PLOT #1

# Set up graphics device
png("plot1.png", width=480, height=480, units="px")

# Plot the distribution of global active power as a histogram
hist(as.numeric(as.character(Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Close the device
dev.off()
