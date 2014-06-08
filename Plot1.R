# read data from csv
data <- read.csv("../household_power_consumption.txt", sep=";", na.string="?")

# converting necessary variables into required formats
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# filtering the data
d <- data[as.Date(data$DateTime) >= as.Date("2007-02-01") & as.Date(data$DateTime) <= as.Date("2007-02-02"), ]

# the graphics device
png("Plot1.png", width=480, height=480, bg = "white")

# the plot
hist(d$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")

dev.off()