
# Plot 1 Histogram of the count of Global_active_power
# Load packages
library(ggplot2)
library(dplyr)

# Define working directory from files
setwd("C:/Users/DELL/Desktop/Exploratory Data Analysis") 


dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Convert date column
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

# Only be using data from the dates 2007-02-01 and 2007-02-02. 
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## create function for plot1
plot1 <- function() 
{
    hist(data$Global_active_power, main="Global Active Power", 
         xlab="Global Active Power", ylab="Frequency", col="Red")
}

# Show plot on screen 
plot1()

# TO save the file using png format
png(file="plot1.png", height=480, width=480)
plot1( )
dev.off()



