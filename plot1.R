# set working directory
setwd("D:\\Cousrses\\Data Analysis\\R for Data Analysis\\Peer-graded Assignment Course Project 1")
getwd()

# load the dataset
power <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
head(power, n = 10)

# change the class of Date
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# subset the date
power <- subset(power, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# change the class of Time
power$Time <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")
datetime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(datetime)

# change the classes form 3 to 9 to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Voltage <- as.numeric(power$Voltage)
power$Global_intensity <- as.numeric(power$Global_intensity)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

# creating plot 1
hist(power$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()