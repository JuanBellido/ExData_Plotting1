plot1<-function()
{
        
        dtInput<-read.table("household_power_consumption.txt"
                            ,header=TRUE,sep=";"
                            ,colClasses=c("character","character","numeric","numeric","numeric",
                                          "numeric","numeric","numeric","numeric"),
                            na.strings=c("?","NA")
                            )
        ##Filter the rows for the two dates(as character yet) required
        dtInput<-dtInput[dtInput$Date=="1/2/2007" | dtInput$Date=="2/2/2007",]
        ##Substitute Time(character) field with datetime by using strptime with
        ##concatenated Date and Time fields (character)
        dtInput$Time<-strptime(paste(dtInput$Date,dtInput$Time),format="%d/%m/%Y %H:%M:%S")
        ##Substitute Date(character) field with date type using as.date
        dtInput$Date<-as.Date(dtInput$Date,format="%d/%m/%Y")
        

        
        png(file="plot1.png",width=480, height=480, units="px")
        
        with(dtInput,hist(Global_active_power
                        ,main="Global Active Power"
                        ,col='red'
                        ,xlab="Global Active Power (kilowatts)")
                        ,ylab="Frequency")     
        
        
        dev.off()
        
        
        
}