PowerConsumption <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
# convert the date variable to Date class
PowerConsumption$Date <- as.Date(PowerConsumption$Date, format = "%d/%m/%Y")

# Subset the data
PowerConsumption <- subset(PowerConsumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
PowerConsumption$datetime <- strptime(paste(PowerConsumption$Date, PowerConsumption$Time), "%Y-%m-%d %H:%M:%S")

# Plot 1
hist(PowerConsumption$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()