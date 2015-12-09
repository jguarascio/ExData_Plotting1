plot2 <- function () {
        
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
        png(file="plot2.png")
        
        plot(df2$Date,df2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
        
        dev.off()
        
}