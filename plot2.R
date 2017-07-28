setwd("C:/Users/pburyi/Desktop/DataScienceCoursera")
data<-read.table("C:/Users/pburyi/Desktop/DataScienceCoursera/household_power_consumption.txt", sep=";", header=T)
data$newdate <- as.Date(data$Date, format="%d/%m/%Y")
data<-data[data$newdate=="2007-02-01" | data$newdate=="2007-02-02",]
data<- within(data, { timestamp=strptime(paste(Date, Time), "%d/%m/%Y%H:%M:%S") })
data$Global_active_power<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]

par(mfrow=c(1,1))
plot(data$timestamp, data$Global_active_power, pch=".", ylab="Global Active Power (killowatts)", xlab= " ")
lines(data$timestamp, data$Global_active_power)
dev.copy(png, file="plot2.png")
dev.off()
