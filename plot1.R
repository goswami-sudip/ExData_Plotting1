#Read the first five rows of the data to get the column names
table5 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 5)

#Read the part of the data required for the assignment
data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880)
#Give the column names to data from table5
colnames(data) <- names(table5)

#paste Date and Time to get a new column "datetime" and change the class using strptime()
data$datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
#open png for plot.png

png("plot1.png", width = 480, height = 480, res = 72)


#The plot1.png
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", yaxt = "n", main = "Gloabl Active Power", cex.axis = 0.75)
axis(side = 2, tck = -0.04, cex.axis = 0.75)
dev.off()
