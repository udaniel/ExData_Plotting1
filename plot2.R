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

plot(x = elecpowersub$Time2, y = elecpowersub$Global_active_power, xlab = "", type = "n",
     ylab = "Global Active Power (kilowatts)", yaxt = "n", ylim = c(0, 7))
lines(x = elecpowersub$Time2, y = elecpowersub$Global_active_power)
axis(side=2, at=seq(0, 6, by=2))


