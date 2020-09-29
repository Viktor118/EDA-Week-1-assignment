library(lubridate)

powerdata <- read.csv("G:/M Tech/Data Science Specialization - Coursera/4-Exploratory Data Analysis/Week 1/household_power_consumption.txt", sep=";")
View(powerdata)

subpower <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")
View(subpower)

#convert date and sub-metering
Datetime <- strptime(paste(subpower$Date, subpower$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
subpower$Sub_metering_1 <- as.character(subpower$Sub_metering_1)
subpower$Sub_metering_2 <- as.character(subpower$Sub_metering_2)

png("plot3.png", 480, 480)
plot(Datetime, as.numeric(subpower$Sub_metering_1), xlab = "", ylab = "Energy sub metering", type = "l")
lines(Datetime, as.numeric(subpower$Sub_metering_2), type = "l", col = "red")
lines(Datetime, subpower$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()