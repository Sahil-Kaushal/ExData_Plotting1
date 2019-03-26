#This is loading data from the same folder as the code

dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# we are subsetting the data according to dates
SubData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#preprocessing
datetime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(SubData$Global_active_power)

#ploting and saving
png("plot2.png", width=480, height=480)
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()