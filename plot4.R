list.files()
dat <- read.table("../household_power_consumption.txt",sep=";",header = T,stringsAsFactors = F)
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat$Time <- strptime(dat$Time, format = "%H:%M:%S")
subdat <- dat[dat$Date == "2007-02-01" |dat$Date == "2007-02-02",]

#plot 4
colnames(subdat)
str(subdat)
subdat$Global_active_power <- as.numeric(subdat$Global_active_power)
subdat$Time[subdat$Date == "2007-02-01"] <- format(subdat$Time[subdat$Date == "2007-02-01"],"2007-02-01 %H:%M:%S")
subdat$Time[subdat$Date == "2007-02-02"] <- format(subdat$Time[subdat$Date == "2007-02-02"],"2007-02-02 %H:%M:%S")
png("plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))
plot(subdat$Time,subdat$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab="")

plot(subdat$Time,subdat$Voltage,type="l",ylab = "Voltage",xlab="datetime")

plot(subdat$Time,subdat$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab="")
lines(subdat$Time,subdat$Sub_metering_2,type="l",col="red")
lines(subdat$Time,subdat$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1)

plot(subdat$Time,subdat$Global_reactive_power,type="l",ylab = "Global_reactive_Power",xlab="datetime")
dev.off()
