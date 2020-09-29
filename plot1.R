powerdata <- read.csv("G:/M Tech/Data Science Specialization - Coursera/4-Exploratory Data Analysis/Week 1/household_power_consumption.txt", sep=";")
View(powerdata)

subpower <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")
View(subpower)

subpower$Global_active_power <- as.character(subpower$Global_active_power)
png("plot1.png", 480, 480)
hist(as.numeric(subpower$Global_active_power), col = "red", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()


