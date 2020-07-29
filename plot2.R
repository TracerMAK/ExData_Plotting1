## Load the data columns from the dates 2007-02-01 and 2007-02-02.
data <- read.table("./data/household_power_consumption.txt", sep=';',
  header=FALSE, skip=66637, nrows=2880)
data[,1] <- as.Date(data[,1], "%d/%m/%Y")

names(data) <- c("Date", "Time", "GlobalActivePower", "GlobalReactivePower",
  "Voltage", "GlobalIntensity", "Submetering1", "Submetering2", "Submetering3")

## Plot 2 : Line plot
count <- nrow(data)
with(data, plot(seq(1:count), GlobalActivePower, type="l",
  ylab="Global Active Power (kilowatts)", xlab="", xaxt="n"))
axis(side=1, at=c(0, count/2, count), labels=c("Thu", "Fri", "Sat"))
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()