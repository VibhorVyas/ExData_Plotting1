plot4 <- function() {
  household_powerconsumption <- read.table("household_power_consumption.txt")
  #check summary for the data type present in txt file
  summary(household_powerconsumption)
  #Checked the seperator and headers
  household_power_consumption <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = FALSE)
  ## Create column in table with date and time merged together
  allDateTime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  household_power_consumption <- cbind(household_power_consumption, allDateTime)
  ## change class of all columns to correct class
  household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
  household_power_consumption$Time <- format(household_power_consumption$Time, format="%H:%M:%S")
  household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)
  household_power_consumption$Global_reactive_power <- as.numeric(household_power_consumption$Global_reactive_power)
  household_power_consumption$Voltage <- as.numeric(household_power_consumption$Voltage)
  household_power_consumption$Global_intensity <- as.numeric(household_power_consumption$Global_intensity)
  household_power_consumption$Sub_metering_1 <- as.numeric(household_power_consumption$Sub_metering_1)
  household_power_consumption$Sub_metering_2 <- as.numeric(household_power_consumption$Sub_metering_2)
  household_power_consumption$Sub_metering_3 <- as.numeric(household_power_consumption$Sub_metering_3)
  ## subset data from 2007-02-01 and 2007-02-02
  subsetdata <- subset(household_power_consumption, Date == "2007-02-01" | Date =="2007-02-02")
  ## plot the 4 graphs
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  with(subsetdata, plot(allDateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
  with(subsetdata, plot(allDateTime, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
  with(subsetdata, plot(allDateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
  lines(subsetdata$allDateTime, subsetdata$Sub_metering_2,type="l", col= "red")
  lines(subsetdata$allDateTime, subsetdata$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  with(subsetdata, plot(allDateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
  dev.off()
}


