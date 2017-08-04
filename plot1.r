library(data.table)
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- fread(unzip(temp, files = "household_power_consumption.txt"),na.strings = "?")
rm(temp)
data$DateTime <- paste(data$Date, data$Time)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subData<-data[data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02"),]

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(subData$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "red")
dev.off()
