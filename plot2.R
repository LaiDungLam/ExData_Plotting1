
png("plot2.png", width=480, height=480)
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

plot(data$date_time, data$Global_active_power, type="l", xaxt="n",
     xlab="", ylab="Global Active Power(kilowatts)",
     cex.main=0.8, cex.lab=1, cex.axis=0.8)
axis(1, at=c(y[[1]], y[[3]], y[[5]]), labels=c("Thu", "Fri", "Sat"))
dev.off()