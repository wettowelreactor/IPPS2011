data <- read.csv(unz('./data/IPPS_FY2011.csv.zip', 'IPPS_FY2011.csv'))
data$Average.Covered.Charges <- as.numeric(data$Average.Covered.Charges)
data$Average.Total.Payments <- as.numeric(data$Average.Total.Payments)
data$Average.Medicare.Payments <- as.numeric(data$Average.Medicare.Payments)