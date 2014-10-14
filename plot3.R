

library(sqldf)

#data file
data.file.name<-"C:/CODE/R/data/household_power_consumption.txt"

#read data
data.selected<-read.csv.sql(data.file.name,
                            sep=";",
                            sql='select 
                                    Date,Time,Sub_metering_1,Sub_metering_2,Sub_metering_3 
                                  from file  
                                  where Date="1/2/2007" 
                                  OR Date="2/2/2007"'
)

#format data
data.selected$DateTime<-as.POSIXct(paste(data.selected$Date,data.selected$Time),format="%d/%m/%Y %H:%M:%S")


#open png file
png(filename = "plot3.png",
    width = 480, 
    height = 480, 
    units = "px",
    bg = "white")

#plot
plot(data.selected$Sub_metering_1 ~ data.selected$DateTime, type='l',  
     ylab='Energy sub metering', xlab='')
lines(data.selected$Sub_metering_2 ~ data.selected$DateTime, type='l', col='Red')
lines(data.selected$Sub_metering_3 ~ data.selected$DateTime, type='l', col='Blue')

#close png
dev.off()


