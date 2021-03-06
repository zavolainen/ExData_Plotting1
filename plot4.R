setwd("~/Data_Science_Specialization/exp_data_analysis")
dataFile <- "~/Data_Science_Specialization/exp_data_analysis/data/household_power_consumption.txt"

## read the whole data set. not working without stringsAsFactors=FALSE, don't understand 100% why ##
allData <- read.table(dataFile, sep = ";", dec=".", na.strings = "?", stringsAsFactors=FALSE)
names(allData) <- c("date","time","global_active_power","global_reactive_power","voltage",
                    "global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")

## subset the wanted dates ## 
data <- allData[allData$date %in% c("1/2/2007","2/2/2007") ,]

## set the values as numeric ##
data$global_active_power <- as.numeric(data$global_active_power)
data$voltage <- as.numeric(data$voltage)
data$global_reactive_power <- as.numeric(data$global_reactive_power)
data$sub_metering_1 <- as.numeric(data$sub_metering_1)
data$sub_metering_2 <- as.numeric(data$sub_metering_2)
data$sub_metering_3 <- as.numeric(data$sub_metering_3)

## combine date and time with as.POSIXct ## 
data$dateTime <- as.POSIXct(paste(data$date, data$time), format="%d/%m/%Y %H:%M:%S")

## plot the data sets and create the file ##

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))
## plot1
plot(data$dateTime, data$global_active_power, type="l", xlab="", ylab="global active power")
## plot 2
plot(data$dateTime, data$voltage, type="l", xlab="datetime", ylab="voltage")
## plot 3
plot(data$dateTime, data$sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$dateTime, data$sub_metering_2, type = "l", col = "red")
lines(data$dateTime, data$sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), bty="n")
## plot 4
plot(data$dateTime, data$global_reactive_power, type="l", xlab="datetime", ylab="global reactive power")
dev.off()