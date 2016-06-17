# ---- plot1 ----

# set up
setwd(file.path("~/Documents/Coursera_datascience/datascience_main",
    "course4_exploratory_data_analysis/ExData_Plotting1/"))

pacman::p_load(data.table, fasttime)

power.consump = fread("../household_power_consumption.txt", na.strings = "?", 
    nrows = 81700)

# convert dates quickly into a useful format
power.consump[, c("y", "m", "d") := rev(tstrsplit(Date, "/"))]
power.consump[, Date := paste(y,m,d, sep = "-")]
power.consump[, datetime := fastPOSIXct(paste(Date, Time), tz = "GMT")]

power.consump = power.consump[datetime >= as.POSIXct("2007-02-01 00:00", tz="GMT") & 
        datetime < as.POSIXct("2007-02-03 00:00", tz="GMT")]

# plot
png("plot1.png")
hist(power.consump$Global_active_power, 
    main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)",
    ylab = "Frequency",
    col = "red")
dev.off()
