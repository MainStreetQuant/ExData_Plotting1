# Hello, Grader!

# Step 1: Set your working directory to whereever you stored the data file then make sure to load the data.table library

library("data.table", lib.loc="~/R/win-library/3.1")


# Step 2: Read in the entire data file that was originally provided, avoiding factors, because they cause difficulties

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
                   

# Step 3: Subset the data for the 2 days in question, Feb 1st and 2nd, 2007

subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# Step 4: Pretty much everything is class character at this point, so coersion is required as we create a variable, Power, to plot

Power <- as.numeric(subdata$Global_active_power)


# Step 5: Plot red filled histogram with axis labels, directly to PNG device
# Note that this will not appear in the R Studio plot window
# Note that this results in text identical to assignment, whereas copying from the screen device to PNG does not
# See discussion forum for discussion of this phenomena

png(filename = "plot1.png", width=480, height=480)
hist(Power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")


#Step 6: Very important! Close the dev device

dev.off()
