setwd("~/Data_Science_Specialization/exp_data_analysis")
dataFile <- "~/Data_Science_Specialization/exp_data_analysis/data/household_power_consumption.txt"

## read the whole data set. not working without stringsAsFactors=FALSE, don't understand 100% why ##
allData <- read.table(dataFile, sep = ";", dec=".", na.strings = "?", stringsAsFactors=FALSE)
names(allData) <- c("date","time","global_active_power","global_reactive_power","voltage",
                    "global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")

## subset the wanted dates ## 
data <- allData[allData$date %in% c("1/2/2007","2/2/2007") ,]
data$global_active_power <- as.numeric(data$global_active_power)

## combine date and time with as.POSIXct ## 
dateTime <- paste(data$date, data$time)
dateTime <- as.POSIXct(dateTime, format="%d/%m/%Y %H:%M:%S")
data$dateTime <- dateTime

## plot the data and create the file ##
png("plot2.png", width=480, height=480)
plot(data$dateTime, data$global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()