data <- read.csv("./trimmed_household_consumption.txt", sep=";") ## Rows for 2/1/2007 and 2/2/2007 only
days <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
png("plot2.png")