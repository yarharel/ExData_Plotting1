## Reading data and creating a subset with the relevant dates
data<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,na.strings = '?'
                 ,colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
datar<-data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]
datar$DT<-paste(datar$Date,datar$Time) 
datar$DT<-strptime(datar$DT,format="%e/%m/%Y %H:%M:%S")

png(file='plot2.png', width = 480, height = 480)
par(mfcol=c(1,1))
with(datar,plot(DT,Global_active_power
                ,type='l'
                ,xlab=''
                ,ylab='Global Active Power (kilowatts)'))
dev.off()