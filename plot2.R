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

png("plot2.png")
plot(small_data$date_time, small_data$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

#plot(small_data$Date, small_data$Global_active_power, type = "l",
#     ylab = "Global Active Power (kilowatts)")

#axis(3, at = c(1,1,1), labels = c("Thu", "Fri", "Sat"))

#dev.copy(png, file = "plot2.png")

dev.off()