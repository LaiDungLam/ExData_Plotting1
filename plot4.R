
png("plot4.png", width=480, height=480)
 
  library(dplyr)
  library(lubridate)
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  data <- data[data$Date == '1/2/2007' | data$Date =='2/2/2007', ]
  data<- tbl_df(data) 
  data <- mutate(data, date_time = paste(data$Date, data$Time))
  data$date_time <- dmy_hms(data$date_time)
  data$date_time <- as.numeric(data$date_time)
  data[, 3:7] <- lapply(data[, 3:7], as.numeric)
  y <- quantile(data$date_time)
  
  par(mfrow=c(2, 2))

  
  plot(data$date_time, data$Global_active_power, type="l", xaxt="n", 
       ylab="Global Active Power", xlab="")
  axis(1, at=c(y[[1]], y[[3]], y[[5]]), labels=c("Thu", "Fri", "Sat"))
  
  plot(data$date_time, data$Voltage, type="l", xaxt="n", 
       xlab="datetime", ylab="Voltage")
  axis(1, at=c(y[[1]], y[[3]], y[[5]]), labels=c("Thu", "Fri", "Sat"))
  
  
  plot(data$date_time, data$Sub_metering_1, type="l", xaxt="n", 
       xlab="", ylab="Energy sub metering")
  axis(1, at=c(y[[1]], y[[3]], y[[5]]), labels=c("Thu", "Fri", "Sat"))
  points(data$date_time, data$Sub_metering_2, type="l" , col="red")
  points(data$date_time, data$Sub_metering_3, type="l",  col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col=c("black", "red", "blue"), lty=c(1, 1, 1), cex=0.9, bty="n")
  plot(data$date_time, data$Global_reactive_power, type="l", xaxt="n", 
       ylab="Global_reactive_power", xlab="datetime")
  axis(1, at=c(y[[1]], y[[3]], y[[5]]), labels=c("Thu", "Fri", "Sat"))
  
dev.off()