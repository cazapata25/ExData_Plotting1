
# Plot 2 Time series plot of the Global_active_power

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

# To convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Function for create the plot2
plot2 <- function() { 
    plot(data$Global_active_power~data$Datetime, type="l",
         ylab="Global Active Power", xlab="")
}


# Show plot on screen 
plot2()

#To save the file using png format
png( file="plot2.png", height=480, width=480 )
plot2( )
dev.off()
