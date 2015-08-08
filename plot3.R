fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, "file.zip")
unzip("file.zip")
elecpower <- read.table("household_power_consumption.txt", header = T, sep = ";")
x <- paste(elecpower$Date, elecpower$Time)
y <- strptime(x, "%d/%m/%Y %H:%M:%S")
elecpower$Time2 <- y

elecpowersub <- subset(elecpower, Date == c("1/2/2007", "2/2/2007"))
elecpowersub$Date <- as.Date(elecpowersub$Date, "%d/%m/%Y")
elecpowersub$Day <- format(as.Date(elecpowersub$Date), "%a")

elecpowersub$Global_active_power <- as.numeric(as.character(elecpowersub$Global_active_power))
elecpowersub$Sub_metering_1 <- as.numeric(as.character(elecpowersub$Sub_metering_1))
elecpowersub$Sub_metering_2 <- as.numeric(as.character(elecpowersub$Sub_metering_2))
elecpowersub$Sub_metering_3 <- as.numeric(as.character(elecpowersub$Sub_metering_3))

plot(x = elecpowersub$Time2, y = elecpowersub$Sub_metering_1, xlab = "", type = "n",
     ylab = "Energy sub metering")
lines(x = elecpowersub$Time2, y = elecpowersub$Sub_metering_1, col = "black")
lines(x = elecpowersub$Time2, y = elecpowersub$Sub_metering_2, col = "red")
lines(x = elecpowersub$Time2, y = elecpowersub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = c(1, 1, 1))
