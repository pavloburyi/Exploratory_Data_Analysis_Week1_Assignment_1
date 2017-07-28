setwd("C:/Users/pburyi/Desktop/DataScienceCoursera")
data<-read.table("C:/Users/pburyi/Desktop/DataScienceCoursera/household_power_consumption.txt", sep=";", header=T)
data$newdate <- as.Date(data$Date, format="%d/%m/%Y")
data<-data[data$newdate=="2007-02-01" | data$newdate=="2007-02-02",]
data<- within(data, { timestamp=strptime(paste(Date, Time), "%d/%m/%Y%H:%M:%S") })
data$Sub_metering_1<-as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2<-as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Sub_metering_3<-as.numeric(levels(data$Sub_metering_3))[data$Sub_metering_3]


par(mfrow=c(1,1))
plot(data$timestamp, data$Sub_metering_1, pch=".", ylab="Energy sub metering", xlab=" ", yaxt="n", ylim = c(0,40))
axis(side = 2, at = c(0,10,20,30))
box()
lines(data$timestamp, data$Sub_metering_1)
lines(data$timestamp, data$Sub_metering_2, col="red")
lines(data$timestamp, data$Sub_metering_3, col="blue")
legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png")
dev.off()