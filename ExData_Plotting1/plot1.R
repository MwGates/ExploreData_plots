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
png('plot1.png', width=480, height=480)
hist(as.numeric(ds1$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()




