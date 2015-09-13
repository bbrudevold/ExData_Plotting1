# plot3
# run to produce a plot 
# this script assumes the text file at this link has been downloaded and extracted to folder "data" in the working directory
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# read data
filePath <- "data/household_power_consumption.txt"
p <- read.csv(filePath,header=TRUE,sep = ";",stringsAsFactors=FALSE)

# select data from only dates 2007-02-01 and 2007-02-02
dataSelect <- p$Date=="1/2/2007" | p$Date=="2/2/2007" 
ps <- p[dataSelect,]

# merge the dates and times to a single variable 
dateTimeString <- paste(ps$Date,ps$Time)
dateTime <- strptime(dateTimeString, "%d/%m/%Y %H:%M:%S")

# get the energy sub metering values
sm1 <- as.numeric(ps$Sub_metering_1)
sm2 <- as.numeric(ps$Sub_metering_2)
sm3 <- as.numeric(ps$Sub_metering_3)

# create a PNG graphics device
png(file = "plot3.png", width = 480, height = 480)

# build a plot of energy sub metering versus time with legend
plot(dateTime,sm1,xlab="",ylab="Energy sub metering",main="",type="l", col="black")
lines(dateTime,sm2, type="l", col="red")
lines(dateTime,sm3, type="l", col="blue")
legend("topright", lty=c(1,1,1),col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close the PNG device
dev.off()  