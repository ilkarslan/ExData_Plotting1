plot1 <- function(){

      # save household_power_consumption.txt to the working directory

      url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(url, destfile ="power.zip")
      powdata <- read.table(unz("power.zip","household_power_consumption.txt"),sep=";",header=TRUE, na.strings= "?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

      #get observations of February 1st and 2nd
      powdata <- powdata[(powdata$Date == "1/2/2007") | (powdata$Date == "2/2/2007"), ]
      
      # transform Date using as.Date() function
      
      powdata$DateTime <- strptime(paste(powdata$Date, powdata$Time), "%d/%m/%Y %H:%M:%S")


      #plot 

      png(filename = "plot1.png", width = 480, height = 480, units = "px")
      hist(powdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
      dev.off()
}