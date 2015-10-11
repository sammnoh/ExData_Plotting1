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
png(file = "plot2.png")
plot(work$DateTime, work$Global_active_power, ylab="Global Active Power (kilowatts)", type="p")
lines(work$DateTime, work$Global_active_power, ylab="Global Active Power (kilowatts)")
dev.off()

