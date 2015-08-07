# JH Coursera Course - Exploratory Data Analysis - August 2015

# Retrieve Data Set if Exists or Create Table
if(!exists("hpc")){
  hpc <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)
}
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")


# Subset the table
ds1 <- subset(hpc, hpc$Date == "2007-02-01"| hpc$Date == "2007-02-02")
ds1$datetime <- as.POSIXct(paste(as.Date(ds1$Date), ds1$Time))



# Send Plot to .png file
png('plot4.png', width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(ds1$Global_active_power~ds1$datetime, type="l", 
     ylab="Global Active Power", xlab="")
plot(ds1$Voltage~ds1$datetime, type="l", 
     ylab="Voltage", xlab="datetime")
plot(ds1$Sub_metering_1~ds1$datetime, type="l", 
     ylab="Energy sub metering", xlab="")
lines(ds1$Sub_metering_2~ds1$datetime,col='Red')
lines(ds1$Sub_metering_3~ds1$datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(ds1$Global_reactive_power~ds1$datetime, type="l", 
     ylab="Global_Reactive_Power",xlab="datetime")

dev.off()



 

