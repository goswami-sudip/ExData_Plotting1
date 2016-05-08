#Read the first five rows of the data to get the column names
table5 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 5)

#Read the part of the data required for the assignment
data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880)
#Give the column names to data from table5
colnames(data) <- names(table5)

#paste Date and Time to get a new column "datetime" and change the class using strptime()
data$datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#open png for plot.png
png("plot4.png", width = 480, height = 480, res = 72)

#The plot4.png

par(mfrow = c(2,2))
#The first plot
x <- data$datetime
y <-data$Global_active_power
plot(x,y, type = "l", xlab ="", ylab= "Global Active Power (kilowatts)")

#The second plot
y <- data$Voltage
plot(x,y, type = "l", xlab = "datetime", ylab = "Voltage")

#The third plot
y1 <- data$Sub_metering_1
plot(x,y1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
y2 <- data$Sub_metering_2
lines(x,y2, col = "red")
y3 <- data$Sub_metering_3
lines(x,y3, col = "blue")
legend("topright", horiz = FALSE, lty = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(2,2,2), cex = 0.75, col = c("black", "red", "blue"))

#The fourth plot
y <- data$Global_reactive_power
plot(x,y, type = "h", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
