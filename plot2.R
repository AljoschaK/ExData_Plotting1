#Set the working dir and file input
setwd("C:/Users/aljoscha/Submissions/Course4/Week1/course_project/")

inputfile   = "household_power_consumption.txt"
plotfile    = "plot2.png"

#read the input table
d <- read.table(inputfile, sep=";",header = TRUE, na.strings = "?")

#select only the needed days
d <- d[grep("^[12]/2/2007", d$Date),]

# add a datetime column
d$datetime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")



#open file
png(plotfile)

#Create plot

plot(d$datetime,
     d$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = ""
)

#close file
dev.off()

