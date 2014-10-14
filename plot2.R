

library(sqldf)

#data file
data.file.name<-"C:/CODE/R/data/household_power_consumption.txt"

#read data
data.selected<-read.csv.sql(data.file.name,
                            sep=";",
                            sql='select 
                                    Date,Time,Global_active_power 
                                  from file  
                                  where Date="1/2/2007" 
                                  OR Date="2/2/2007"'
)

#format data
data.selected$DateTime<-as.POSIXct(paste(data.selected$Date,data.selected$Time),format="%d/%m/%Y %H:%M:%S")


#open png file
png(filename = "plot2.png",
    width = 480, 
    height = 480, 
    units = "px",
    bg = "white")

#plot
plot(data.selected$Global_active_power ~ data.selected$DateTime, 
     ylab='Global Active Power (kilowatts)',
     type='l', 
     xlab='')


#close png
dev.off()



