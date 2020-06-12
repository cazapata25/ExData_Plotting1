
# Plot 3 Time series plot of the Sub_metering_1~3

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

## Function to create plot3
plot3 <- function(){
    with(data, {
        plot(Sub_metering_1~Datetime, col='black', type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
    })
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

# Show plot on screen 
plot3()

# To save the file using png function
png( file="plot3.png", height=480, width=480 )
plot3( )
dev.off()
