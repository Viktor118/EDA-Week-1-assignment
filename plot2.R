library(lubridate)

powerdata <- read.csv("G:/M Tech/Data Science Specialization - Coursera/4-Exploratory Data Analysis/Week 1/household_power_consumption.txt", sep=";")
View(powerdata)

subpower <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")
View(subpower)

#convert date
Datetime <- strptime(paste(subpower$Date, subpower$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", 480, 480)
plot(Datetime, subpower$Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type = "l")
dev.off()