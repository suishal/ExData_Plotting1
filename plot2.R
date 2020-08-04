list.files()
dat <- read.table("../household_power_consumption.txt",sep=";",header = T,stringsAsFactors = F)
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat$Time <- strptime(dat$Time, format = "%H:%M:%S")
subdat <- dat[dat$Date == "2007-02-01" |dat$Date == "2007-02-02",]

#plot 2
colnames(subdat)
str(subdat)
subdat$Global_active_power <- as.numeric(subdat$Global_active_power)
subdat$Time[subdat$Date == "2007-02-01"] <- format(subdat$Time[subdat$Date == "2007-02-01"],"2007-02-01 %H:%M:%S")
subdat$Time[subdat$Date == "2007-02-02"] <- format(subdat$Time[subdat$Date == "2007-02-02"],"2007-02-02 %H:%M:%S")
str(subdat)
png("plot2.png",width = 480, height = 480)
plot(subdat$Time,subdat$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()

