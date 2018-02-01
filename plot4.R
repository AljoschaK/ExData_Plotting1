#Set the working dir and file input
setwd("C:/Users/aljoscha/Submissions/Course4/Week1/course_project/")

inputfile   = "household_power_consumption.txt"
plotfile    = "plot4.png"

#read the input table
d <- read.table(inputfile, sep=";",header = TRUE, na.strings = "?")

#select only the needed days
d <- d[grep("^[12]/2/2007", d$Date),]

# add a datetime column
d$datetime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")



#open file
png(plotfile)

#Create plot


par(mfrow=c(2,2))
plot(d$datetime,
     d$Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab = ""
)

plot(d$datetime,
     d$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime"
)


plot(d$datetime,
     d$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = ""
)
lines(d$datetime,
      d$Sub_metering_2,
      type = "l",
      col="red"
      
)
lines(d$datetime,
      d$Sub_metering_3,
      type = "l",
      col="blue"
      
)
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty=1)

plot(d$datetime,
     d$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime"
)


#close file
dev.off()

