## Reading data and creating a subset with the relevant dates
data<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,na.strings = '?'
                 ,colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
datar<-data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]
datar$DT<-paste(datar$Date,datar$Time) 
datar$DT<-strptime(datar$DT,format="%e/%m/%Y %H:%M:%S")

png(file='plot3.png', width = 480, height = 480)
par(mfcol=c(1,1))
with(datar,plot(DT,Sub_metering_1
                ,type='n'
                ,xlab=''
                ,ylab='Energy sub metering'))
with(datar,points(DT,Sub_metering_1,type="l",col='black'))
with(datar,points(DT,Sub_metering_2,type="l",col='red'))
with(datar,points(DT,Sub_metering_3,type="l",col='blue'))
legend('topright',col=c('black','red','blue'),lwd=c(1,1,1)
                 ,legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()