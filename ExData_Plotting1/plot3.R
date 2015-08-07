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
png('plot3.png', width=480, height=480)

plot(ds1$Sub_metering_1~ds1$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
lines(ds1$Sub_metering_2~ds1$datetime,col='Red')
lines(ds1$Sub_metering_3~ds1$datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()



 

