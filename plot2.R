# plot2
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

# create a PNG graphics device
png(file = "plot2.png", width = 480, height = 480)

# get the global active power
gap <- as.numeric(ps$Global_active_power)

# build a plot of global active power versus time 
plot(dateTime,gap,xlab="",ylab="Global Active Power (kilowatts)",main="",type="l")

# close the PNG device
dev.off()  