setwd("D:/cloud storage/Google Drive/Coursera/exp data/assignment1")

big_data <- read.csv("D:/cloud storage/Google Drive/Coursera/exp data/assignment1/household_power_consumption.txt", 
                     sep=";", na.strings="?")

Date_new <- as.Date(big_data$Date, format = "%d/%m/%Y")

big_data_new <- data.frame(big_data, Date_new)

#days <- big_data$Date

small_data_old <- big_data_new[big_data_new$Date_new >= as.Date("2007-02-01") & 
                                 big_data_new$Date_new <= as.Date("2007-02-02"),] 

# days <- weekdays(small_data$Date)

old_date_time <- paste(small_data_old$Date, small_data_old$Time, sep = " ")

date_time = strptime(old_date_time,
                     format = "%d/%m/%Y %H:%M:%S")

small_data <- data.frame(small_data_old, date_time)

png("plot3.png")

plot(small_data$date_time, small_data$Sub_metering_1, type = "l",
     ylab="Energy sub metering", xlab="")
lines(small_data$date_time, small_data$Sub_metering_2, col = "red")
lines(small_data$date_time, small_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))

dev.off()
