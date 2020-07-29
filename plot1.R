## Load the data columns from the dates 2007-02-01 and 2007-02-02.
data <- read.table("./data/household_power_consumption.txt", sep=';',
  header=FALSE, skip=66637, nrows=2880)
data[,1] <- as.Date(data[,1], "%d/%m/%Y")

names(data) <- c("Date", "Time", "GlobalActivePower", "GlobalReactivePower",
  "Voltage", "GlobalIntensity", "Submetering1", "Submetering2", "Submetering3")

## Plot 1 : Histogram
with(data, hist(GlobalActivePower, xlab="Global Active Power (kilowatts)",
  col="red", main="Global Active Power"))
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()