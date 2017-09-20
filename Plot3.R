plot3 <- function(){
  #read the data 
  household_powerconsumption <- read.table("household_power_consumption.txt")
  #check summary for the data type present in txt file
  summary(household_powerconsumption)
  #Checked the seperator and headers
  household_power_consumption <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors = FALSE)
  # checking summary whether data is proper or not
  summary(household_powerconsumption)
  
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
  ## plot globalactivepower vs date&time
  png("plot3.png", width=480, height=480)
  with(subsetdata, plot(allDateTime, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
  lines(subsetdata$allDateTime, subsetdata$Sub_metering_2,type="l", col= "red")
  lines(subsetdata$allDateTime, subsetdata$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  dev.off()
}

