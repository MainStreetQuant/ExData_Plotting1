# Hello, Grader!

# Step 1: Set your working directory to whereever you stored the data file then make sure to load the data.table library

library("data.table", lib.loc="~/R/win-library/3.1")


# Step 2: Read in the entire data file that was originally provided, avoiding factors, because they cause difficulties

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)


# Step 3: Subset the data for the 2 days in question, Feb 1st and 2nd, 2007

subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# Step 4: Pretty much everything is class character at this point, so coersion is required as we create variables to plot

Day <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Meter1 <- as.numeric(subdata$Sub_metering_1)
Meter2 <- as.numeric(subdata$Sub_metering_2)
Meter3 <- as.numeric(subdata$Sub_metering_3)


# Step 5: Plot multi-colored line chart by meter and day-of-week, with legend, directly to PNG device
# Note that this will not appear in the R Studio plot window
# Note that this results in text identical to assignment, whereas copying from the screen device to PNG does not
# See discussion forum for discussion of this phenomena

png(filename = "plot3.png", width=480, height=480)
plot(Day, Meter1, type="l", xlab="", ylab="Energy sub metering")
lines(Day, Meter2, col="red")
lines(Day, Meter3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"))


#Step 6: Very important! Close the device

dev.off()