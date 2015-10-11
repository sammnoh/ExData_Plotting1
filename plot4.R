library(datasets)
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile="./data4-1.zip", mode = "wb" )
unzip("./data4-1.zip", exdir= "data4-1" )
list.files("data4-1")

full <- read.table("./data4-1/household_power_consumption.txt", header = TRUE, sep = ";")

full$Date <- as.Date(full$Date, format = "%d/%m/%Y")
full$Global_active_power <- as.numeric(as.character(full$Global_active_power))
full["DateTime"] <- NA
#Combine Date and Time column via paste()
full$DateTime <- paste(full$Date,full$Time) 
#subset dataframe to only include select dates
work <- subset(full, Date == "2007-02-02" | Date == "2007-02-01")
#change DateTime from character to factor. Characters cannot be plotted
work$DateTime <- as.factor(work$DateTime)
#change all sub_meterings to numeric
work$Sub_metering_1 <- as.numeric(as.character(work$Sub_metering_1))
work$Sub_metering_2 <- as.numeric(as.character(work$Sub_metering_2))
work$Sub_metering_3 <- as.numeric(as.character(work$Sub_metering_3))

par(mfrow = c(2,2))
plot(work$DateTime, work$Global_active_power, ylab="Global Active Power (kilowatts)")
plot(work$DateTime, work$Voltage, ylab="Voltage")
plot(work$DateTime, work$Sub_metering_1, type ="l")
lines(work$DateTime, work$Sub_metering_2, type="l", col = "red")
lines(work$DateTime, work$Sub_metering_3, type="l", col = "blue")
legend("topright", pch = 1, col=c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(work$DateTime, work$Global_reactive_power, ylab="Global Reactive Power")
dev.copy(png, file="plot4.png")
dev.off()


