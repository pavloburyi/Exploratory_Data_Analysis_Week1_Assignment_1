setwd("C:/Users/pburyi/Desktop/DataScienceCoursera")
data<-read.table("C:/Users/pburyi/Desktop/DataScienceCoursera/household_power_consumption.txt", sep=";", header=T)
data$newdate <- as.Date(data$Date, format="%d/%m/%Y")
data<-data[data$newdate=="2007-02-01" | data$newdate=="2007-02-02",]
data<- within(data, { timestamp=strptime(paste(Date, Time), "%d/%m/%Y%H:%M:%S") })
data$Global_active_power<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$Global_reactive_power<-as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]
data$Voltage<-as.numeric(levels(data$Voltage))[data$Voltage]
data$Sub_metering_1<-as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2<-as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Sub_metering_3<-as.numeric(levels(data$Sub_metering_3))[data$Sub_metering_3]


par(mfrow=c(2,2))
plot(data$timestamp, data$Global_active_power, pch=".", ylab="Global Active Power", xlab= " ")
lines(data$timestamp, data$Global_active_power)
plot(data$timestamp, data$Voltage, pch=".", ylab="Voltage", xlab="datetime ")
lines(data$timestamp, data$Voltage)
plot(data$timestamp, data$Sub_metering_1, pch=".", ylab="Energy sub metering", xlab=" ", yaxt="n", ylim = c(0,40))
axis(side = 2, at = c(0,10,20,30))
box()
lines(data$timestamp, data$Sub_metering_1)
lines(data$timestamp, data$Sub_metering_2, col="red")
lines(data$timestamp, data$Sub_metering_3, col="blue")
legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.75, bty = "n")
plot(data$timestamp, data$Global_reactive_power, pch=".", ylab="Global_reactive_power", xlab="datetime ",  las = 1)
lines(data$timestamp, data$Global_reactive_power)
dev.copy(png, file="plot4.png")
dev.off()
