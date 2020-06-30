
png("plot1.png", width=480, height=480)

  library(dplyr)
  library(lubridate)
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  data <- data[data$Date == '1/2/2007' | data$Date =='2/2/2007', ]
  data<- tbl_df(data) 
  data <- mutate(data, date_time = paste(data$Date, data$Time))
  data$date_time <- dmy_hms(data$date_time)
  data$date_time <- as.numeric(data$date_time)
  data[, 3:7] <- lapply(data[, 3:7], as.numeric)
  hist(data$Global_active_power, col='red', xlab="Global Active Power(kilowatts)",
       main="Global Active Power", )
dev.off()