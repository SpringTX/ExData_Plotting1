

library(sqldf)

#data file
data.file.name<-"C:/CODE/R/data/household_power_consumption.txt"

#read data
data.selected<-read.csv.sql(data.file.name,
                            sep=";",
                            sql='select 
                                    Date,Time,Global_active_power, Global_reactive_power,
                                    Sub_metering_1,Sub_metering_2,Sub_metering_3, Voltage 
                                  from file  
                                  where Date="1/2/2007" 
                                  OR Date="2/2/2007"'
)

#format data
data.selected$DateTime<-as.POSIXct(paste(data.selected$Date,data.selected$Time),format="%d/%m/%Y %H:%M:%S")


#open png file
png(filename = "plot4.png",
    width = 480, 
    height = 480, 
    units = "px",
    bg = "white")

par(mfrow = c(2,2))

#plot 1
plot(data.selected$Global_active_power ~ data.selected$DateTime, 
     ylab='Global Active Power (kilowatts)',
     type='l', 
     xlab='')

#plot 2
plot(data.selected$Voltage ~ data.selected$DateTime, 
     type='l', xlab='')

#plot 3
plot(data.selected$Sub_metering_1 ~ data.selected$DateTime, type='l',  
     ylab='Energy sub metering', xlab='')
lines(data.selected$Sub_metering_2 ~ data.selected$DateTime, type='l', col='Red')
lines(data.selected$Sub_metering_3 ~ data.selected$DateTime, type='l', col='Blue')


#plot 4
plot(data.selected$Global_reactive_power ~ data.selected$DateTime, 
     type='l', xlab='')

#close png
 dev.off()

