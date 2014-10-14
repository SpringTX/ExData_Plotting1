

library(sqldf)

#data file
data.file.name<-"C:/CODE/R/data/household_power_consumption.txt"

#read data
data.selected<-read.csv.sql(data.file.name,
                        sep=";",
                        sql='select * from file  
                              where Date="1/2/2007" 
                              OR Date="2/2/2007"'
                      )

#open png file
png(filename = "plot1.png",
    width = 480, 
    height = 480, 
    units = "px",
    bg = "white")


#graph
hist(as.numeric(data.selected$Global_active_power), 
     ylim = c(0,1200),
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col="red")

#close png
dev.off()
