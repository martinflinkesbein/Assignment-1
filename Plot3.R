#read.table
assignment<-read.table("~/Documents/Promotion/Courses/Data_Science_Specialisation/Exploratory_Data_Analytics_4/Assignment/household_power_consumption.txt", sep = ";", 
                       header = TRUE, colClasses =c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
# look at Date
head(assignment)

#Tranfer as Date
as.Date(assignment$Date)

class(assignment$Global_active_power)

# Combine February Day 1 to 2. 
feb1 <- subset(assignment, c(Date == "1/2/2007"))
feb2 <- subset(assignment, c(Date == "2/2/2007"))

FEB<- rbind.data.frame(feb1,feb2)


# new date
y <- paste(FEB$Date,FEB$Time)
days <- strptime (y,"%d/%m/%Y %H:%M:%S")
hours <-strptime (FEB$Time,"%S:%M:%H" )


names(FEB)

#Save to png
png("plot3.png", width=480, height=480)

# Plot Graphic

plot(days,FEB$Sub_metering_1,type = "n", xlab="", ylab="Energy Sub-Metering" )
lines(days,FEB$Sub_metering_1)
lines(days,FEB$Sub_metering_2, col ="red")
lines(days,FEB$Sub_metering_3, col ="blue")
legend ("topright",pch = 15, col = c("grey", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()