#Read the first five rows of the data to get the column names
table5 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 5)

#Read the part of the data required for the assignment
data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880)
#Give the column names to data from table5
colnames(data) <- names(table5)

#paste Date and Time to get a new column "datetime" and change the class using strptime()
data$datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#open png for plot.png
png("plot3.png", width = 480, height = 480, res = 72)

#The plot3.png
x <- data$datetime
y1 <- data$Sub_metering_1
plot(x,y1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
y2 <- data$Sub_metering_2
lines(x,y2, col = "red")
y3 <- data$Sub_metering_3
lines(x,y3, col = "blue")
legend("topright", horiz = FALSE, lty = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(2,2,2), cex = 0.75, col = c("black", "red", "blue"))
dev.off() 

