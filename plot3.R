plot3 <- function(){
      
      # save household_power_consumption.txt to the working directory
      
      url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(url, destfile ="power.zip")
      powdata <- read.table(unz("power.zip","household_power_consumption.txt"),sep=";",header=TRUE, na.strings= "?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
      
      #get observations of February 1st and 2nd
      powdata <- powdata[(powdata$Date == "1/2/2007") | (powdata$Date == "2/2/2007"), ]
      
      # transform Date using as.Date() function
      
      powdata$DateTime <- strptime(paste(powdata$Date, powdata$Time), "%d/%m/%Y %H:%M:%S")
      
      
      #plot 
      
      png(filename = "plot3.png", width = 480, height = 480, units = "px")
      cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      plot(powdata$DateTime, powdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
      lines(powdata$DateTime, powdata$Sub_metering_2, type = "l", col ="red")
      lines(powdata$DateTime, powdata$Sub_metering_3, type = "l", col = "blue")
      legend("topright", lty = 1, lwd = 1, col = c("black", "blue", "red"), legend = cols)
      dev.off()
      
     
}