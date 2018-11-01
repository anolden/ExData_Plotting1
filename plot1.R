#This R code is for Plot1

#First read in the data file.
#Because we are only interested in data from the dates 2007-02-01 and 2007-02-02. 
#I will read the data from just those dates rather than reading in the entire dataset 


# read in data set, only data from dates 2007-02-01 and 2007-02-02
setwd("C:/Users/anolden/Dropbox (MBF)/Coursera/Coursera/Assignment/Graphs Assignment 1")
data<-read.csv(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
               stringsAsFactors = FALSE, nrow = 2075259, comment.char = "", check.names = FALSE, quote='\"')
subdata<-subset(data, data$Date == "1/2/2007"| data$Date == "2/2/2007")


#Make Plot 1
#Histogram of Global Active Power

png("plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, col="red", border = "black",
     xlab="Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")
dev.off()
