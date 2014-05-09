data <- read.csv("./trimmed_household_consumption.txt", sep = ";") ## Rows for 2/1/2007 and 2/2/2007 only
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
png("plot1.png")