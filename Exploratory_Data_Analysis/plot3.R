data <- read.csv("./trimmed_household_consumption.txt", sep=";") ## Rows for 2/1/2007 and 2/2/2007 only
days <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(days, data$Sub_metering_2, col="red")
lines(days, data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid")
png("plot3.png")