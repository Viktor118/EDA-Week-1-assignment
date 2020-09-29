library(lubridate)

powerdata <- read.csv("G:/M Tech/Data Science Specialization - Coursera/4-Exploratory Data Analysis/Week 1/household_power_consumption.txt", sep=";")
View(powerdata)

subpower <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")
View(subpower)

#convert date and sub-metering
Datetime <- strptime(paste(subpower$Date, subpower$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
subpower$Sub_metering_1 <- as.character(subpower$Sub_metering_1)
subpower$Sub_metering_2 <- as.character(subpower$Sub_metering_2)

png("plot4.png", 480, 480)
par(mfrow = c(2,2))

#plot(1,1)
subpower$Global_active_power <- as.character(subpower$Global_active_power)
plot(Datetime, as.numeric(subpower$Global_active_power), xlab = "", ylab = "Global Active Power", type = "l")

#plot(1,2)
subpower$Voltage <- as.character(subpower$Voltage)
plot(Datetime, as.numeric(subpower$Voltage), xlab = "datetime", ylab = "Voltage", type = "l")

#plot(2,1)
plot(Datetime, as.numeric(subpower$Sub_metering_1), xlab = "", ylab = "Energy sub metering", type = "l")
lines(Datetime, as.numeric(subpower$Sub_metering_2), type = "l", col = "red")
lines(Datetime, subpower$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#plot(2,2)
subpower$Global_reactive_power <- as.character(subpower$Global_reactive_power)
plot(Datetime, as.numeric(subpower$Global_reactive_power), xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()
