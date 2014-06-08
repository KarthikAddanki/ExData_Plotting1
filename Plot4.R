# read data from csv
data <- read.csv("../household_power_consumption.txt", sep=";", na.string="?")

# converting necessary variables into required formats
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# filtering the data
d <- data[as.Date(data$DateTime) >= as.Date("2007-02-01") & as.Date(data$DateTime) <= as.Date("2007-02-02"), ]

# the graphics device
png("Plot4.png", width=480, height=480, bg = "white")

# the plots
par(mfrow = c(2,2))
with(d, 
     {
            plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
            plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
            plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
            lines(DateTime, Sub_metering_2, col="red")
            lines(DateTime, Sub_metering_3, col="blue")
            legend("topright", cex=0.7, bty="n", lty=c(1,1), col=c("black", "red", "blue"), 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
            plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_Power")
      }
     )
dev.off()