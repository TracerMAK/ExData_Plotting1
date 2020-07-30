## Load the data columns from the dates 2007-02-01 and 2007-02-02.
data <- read.table("./data/household_power_consumption.txt", sep=';',
  header=FALSE, skip=66637, nrows=2880)
data[,1] <- as.Date(data[,1], "%d/%m/%Y")

names(data) <- c("Date", "Time", "GlobalActivePower", "GlobalReactivePower",
  "Voltage", "GlobalIntensity", "Submetering1", "Submetering2", "Submetering3")

count <- nrow(data)
par(mfcol=c(2,2))

## ------------------------ Plot 1 --------------------------------------------
with(data, plot(seq(1:count), GlobalActivePower, type="l",
  ylab="Global Active Power", xlab="", xaxt="n"))
axis(side=1, at=c(0, count/2, count), labels=c("Thu", "Fri", "Sat"))

## ------------------------ Plot 2 --------------------------------------------
with(data, plot(seq(1:count), Submetering1, type="l",
   ylab="Energy sub metering", xlab="", xaxt="n"))
lines(seq(1:count), data$Submetering2, col="red")
lines(seq(1:count), data$Submetering3, col="blue")

axis(side=1, at=c(0, count/2, count), labels=c("Thu", "Fri", "Sat"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty=1, lwd=2, col=c("black", "red", "blue"), pt.cex=1, cex=0.9, bty="n")
  
## ------------------------ Plot 3 --------------------------------------------
with(data, plot(seq(1:count), Voltage, type="l", xlab="datetime",
  ylab="Voltage", xaxt="n"))
axis(side=1, at=c(0, count/2, count), labels=c("Thu", "Fri", "Sat"))

## ------------------------ Plot 4 --------------------------------------------
with(data, plot(seq(1:count), GlobalReactivePower, type="l", xlab="datetime",
  ylab="Global_reactive_power", xaxt="n"))
axis(side=1, at=c(0, count/2, count), labels=c("Thu", "Fri", "Sat"))

dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
  