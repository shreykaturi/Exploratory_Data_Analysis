initial<-read.table("household_power_consumption.txt", header=TRUE,sep=";", nrows=5)
hpc<-read.table("household_power_consumption.txt", header=TRUE,sep=";", skip=66630, 
                nrows=2900, col.names=names(initial), na.strings=c("?"),
                colClasses=c("character", "character","numeric","numeric","numeric","numeric",
                             "numeric","numeric","numeric"))


hpc$Date<-as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$Time<-strptime(paste(hpc$Date,hpc$Time),"%F %T")
hpc<-subset(hpc,hpc$Date %in% as.Date(c("2007-02-01","2007-02-02")))
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
hist(hpc$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

png("plot1.png", width=480, height=480)
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
hist(hpc$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()