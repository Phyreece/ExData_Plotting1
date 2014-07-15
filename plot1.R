firstRow<-read.table('household_power_consumption.txt',sep=';',header=T,na.strings='?',stringsAsFactors=F,nrow=1)
numCol<-ncol(firstRow)
firstCol<-read.table('household_power_consumption.txt',sep=';',header=T,na.strings='?',stringsAsFactors=F,colClasses=c(NA,rep('NULL',numCol-1)))
firstCol$Date<-as.Date(firstCol$Date,'%d/%m/%Y')
rowNum<-which(firstCol$Date>='2007-02-01'&firstCol$Date<='2007-02-02')
data<-read.table('household_power_consumption.txt',sep=';',header=T,na.strings='?',stringsAsFactors=F,skip=rowNum[1]-1,nrow=length(rowNum))
names(data)<-names(firstRow)
attach(data)
png(filename='plot1.png',width=480,height=480,units='px')
hist(Global_active_power,main='Global Active Power',xlab='GlobalActive Power (kilowatts)',ylab='Frequency',col='red')
dev.off()
weekday<-weekdays(firstCol$Date)
weekday<-weekday[-(rowNum)]
weekday<-weekday[1:2880]
data$Weekday<-weekday
