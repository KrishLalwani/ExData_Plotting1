PowerConsumption <- read.table("household_power_consumption.txt", header = T, 
                               sep = ";", na.strings = "?")
# convert the date variable to Date class
PowerConsumption$Date <- as.Date(PowerConsumption$Date, format = "%d/%m/%Y")

# Subset the data
PowerConsumption <- subset(PowerConsumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
PowerConsumption$datetime <- strptime(paste(PowerConsumption$Date, PowerConsumption$Time), "%Y-%m-%d %H:%M:%S")

# Plot 3
PowerConsumption$datetime <- as.POSIXct(PowerConsumption$datetime)

attach(PowerConsumption)
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(PowerConsumption)