
png("plot3.png", width=480, height=480)
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
  
  plot(data$date_time, data$Sub_metering_1, type="l", xaxt="n", ylab="Energy sub metering", xlab="")
  

  
  axis(1, at=c(y[[1]], y[[3]], y[[5]]), labels=c("Thu", "Fri", "Sat"))
  points(data$date_time, data$Sub_metering_2, type="l" , col="red")
  points(data$date_time, data$Sub_metering_3, type="l",  col="blue")
  op <- par(cex = 1.5)
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), lty=c(1, 1, 1), cex=0.8)
dev.off()