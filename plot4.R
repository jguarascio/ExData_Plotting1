plot4 <- function () {
        
        # Read the source file, load number columns as numbers
        df<-read.csv("household_power_consumption.txt",
                     sep=";",
                     colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                     na.strings="?")
        
        # Subset the data frame for only 2 dates
        df2<-df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]
        
        # Remove the large source data frame object from memory
        rm(df)
        
        # Recast the date column as a full date time object
        df2$Date=strptime(paste(df2$Date,df2$Time),"%d/%m/%Y %H:%M:%S")
        
        # Build the graph in a new png file
        png(file="plot4.png")
        
        # Set up a plot with 4 sub-graphs
        par(mfcol=c(2,2))
        
        # Graph 1
        with(df2,{
                plot(Date,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
        })
        
        # Graph 2
        with(df2,{
                plot(Date,Sub_metering_1,type="l",ylab="Energy sub metering")
                points(Date,Sub_metering_2,type="l",col="red")
                points.default(Date,Sub_metering_3,type="l",col="blue")
        })
        
        legend("topright",col=c("black","red","blue"),legend=names(df2)[7:9],lty=1)
        
        # Graph 3
        with(df2,{plot(Date,Voltage,type="l")})
        
        # Graph 4
        with(df2,{plot(Date,Global_reactive_power,type="l")})
        
        dev.off()
        
}



