# load the dataset from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

setwd("D:/cloud storage/Google Drive/Coursera/exp data/assignment1")

big_data <- read.csv("D:/cloud storage/Google Drive/Coursera/exp data/assignment1/household_power_consumption.txt", 
                                        sep=";", na.strings="?")

big_data$Date <- as.Date(big_data$Date, format = "%d/%m/%Y")



small_data <- big_data[big_data$Date >= as.Date("2007-02-01") & 
                         big_data$Date <= as.Date("2007-02-02"),] 

histinfo <- hist(small_data$Global_active_power)

png("plot1.png")

hist(small_data$Global_active_power, col = "red", main = "Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab = "Frequency")

#dev.copy(png, file = "plot1.png")
dev.off()
