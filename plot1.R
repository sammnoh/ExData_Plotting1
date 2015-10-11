URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile="./data4-1.zip", mode = "wb" )
unzip("./data4-1.zip", exdir= "data4-1" )
list.files("data4-1")

full <- read.table("./data4-1/household_power_consumption.txt", header = TRUE, sep = ";")

full$Date <- as.Date(full$Date, format = "%d/%m/%Y")
full$Global_active_power <- as.numeric(as.character(full$Global_active_power))
work <- subset(full, Date == "2007-02-02" | Date == "2007-02-01")

png(file = "plot1.png")
hist(work$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab="Frequency")

       