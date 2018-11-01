#This R code is for Plot4

#First read in the data file.
#Because we are only interested in data from the dates 2007-02-01 and 2007-02-02. 
#I will read the data from just those dates rather than reading in the entire dataset 

#Note: Convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.

# read in data set, only data from dates 2007-02-01 and 2007-02-02
setwd("C:/Users/anolden/Dropbox (MBF)/Coursera/Coursera/Assignment/Graphs Assignment 1")
data<-read.csv(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
               stringsAsFactors = FALSE, nrow = 2075259, comment.char = "", check.names = FALSE, quote='\"')
subdata<-subset(data, data$Date == "1/2/2007"| data$Date == "2/2/2007")


#Create a datetime variable (DMY HMS)
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
Datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(Datetime)


#Make Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
    plot(subdata$Global_active_power~subdata$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")
   
    plot(subdata$Voltage~subdata$Datetime, type = "l", ylab = "Voltage", xlab = " ")
    
    with(subdata, {plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering", xlab = " ")
       lines(Sub_metering_2~Datetime, col = "red")
       lines(Sub_metering_3~Datetime, col = "blue")})
        legend("topright", col=c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(subdata$Global_reactive_power~subdata$Datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
