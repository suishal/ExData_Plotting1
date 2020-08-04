list.files()
dat <- read.table("../household_power_consumption.txt",sep=";",header = T,stringsAsFactors = F)
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat$Time <- strptime(dat$Time, format = "%H:%M:%S")
subdat <- dat[dat$Date == "2007-02-01" |dat$Date == "2007-02-02",]

#plot 1
colnames(subdat)
str(subdat)
subdat$Global_active_power <- as.numeric(subdat$Global_active_power)
str(subdat)
png("plot1.png",width = 480, height = 480)
hist(subdat$Global_active_power,col = "red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()

