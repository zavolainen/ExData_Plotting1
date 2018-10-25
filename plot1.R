setwd("~/Data_Science_Specialization/exp_data_analysis")
dataFile <- "~/Data_Science_Specialization/exp_data_analysis/data/household_power_consumption.txt"

## read the whole data set. not working without stringsAsFactors=FALSE, don't understand 100% why ##
allData <- read.table(dataFile, sep = ";", dec=".", na.strings = "?", stringsAsFactors=FALSE)
names(allData) <- c("date","time","global_active_power","global_reactive_power","voltage",
                    "global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")

## subset the wanted dates ## 
data <- allData[allData$date %in% c("1/2/2007","2/2/2007") ,]

## create subset for histogram and make the values numeric ##
histData <- as.numeric(data$global_active_power)

## start the graphic device, create the histogram and save it as png ##
png("plot1.png", width=480, height=480)
hist(histData, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "Red")
dev.off()