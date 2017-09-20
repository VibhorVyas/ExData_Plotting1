#read the data 
household_powerconsumption <- read.table("household_power_consumption.txt")
#check summary for the data type present in txt file
summary(household_powerconsumption)
#Checked the seperator and headers
household_powerconsumption <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = FALSE)
# checking summary whether data is proper or not
summary(household_powerconsumption)
#converting data format as explained.
household_powerconsumption$Date <- as.Date(household_powerconsumption$Date,format = "%d/%m/%Y")
household_powerconsumption$Time <- format(household_powerconsumption$Time,format="%H:%M:%S")
household_powerconsumption$Global_active_power <- as.numeric(household_powerconsumption$Global_active_power)
household_powerconsumption$Global_reactive_power <- as.numeric(household_powerconsumption$Global_reactive_power)
household_powerconsumption$Voltage <- as.numeric(household_powerconsumption$Voltage)
household_powerconsumption$Global_intensity <- as.numeric(household_powerconsumption$Global_intensity)
household_powerconsumption$Sub_metering_1 <- as.numeric(household_powerconsumption$Sub_metering_1)
household_powerconsumption$Sub_metering_2 <- as.numeric(household_powerconsumption$Sub_metering_2)
household_powerconsumption$Sub_metering_3 <- as.numeric(household_powerconsumption$Sub_metering_3)
#Subset the data 
subsetdata < - subset(household_powerconsumption,Date == "2007-02-01" | Date =="2007-02-02")

## plot histogram of global active power for those 2 days
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (KW)")
dev.off()
