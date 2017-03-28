TidyData <- function(full, features){

# Make list of feature indices and values that contain mean or std. deviation values

mean.idx <- grep("[Mm]ean()", features$V2)
mean.names <- grep("[Mm]ean()", features$V2, value=TRUE)

std.idx <- grep("[Ss]td()", features$V2)
std.names <- grep("[Ss]td()", features$V2, value=TRUE)

# Subset full data set: Only select variables that contain mean or std. dev. values

mean.vars<-select(full, mean.idx)
std.vars<-select(full, std.idx)

# Set variable name from feature list

names(mean.vars) <- mean.names
names(std.vars) <- std.names

# Average the observation of each variable, i.e. take column means of subsetted data

avg.means<-colMeans(mean.vars)
avg.std<-colMeans(std.vars)

# Combine variable names and average value of each variable to new data frame and set its
# column names

measurement.means<-tbl_df(cbind(mean.names, avg.means))
names(measurement.means)<-c("Measurement", "Mean")

measurement.stddev<-tbl_df(cbind(std.names, avg.std))
names(measurement.stddev)<-c("Measurement", "StdDev")

# Unify feature names for merging mean and std.dev data frames

measurement.means$Measurement<-gsub("\\-mean\\(\\)\\-", "", measurement.means$Measurement)
measurement.means$Measurement<-gsub("\\-mean\\(\\)", "", measurement.means$Measurement)

measurement.stddev$Measurement<-gsub("\\-std\\(\\)\\-", "", measurement.stddev$Measurement)
measurement.stddev$Measurement<-gsub("\\-std\\(\\)", "", measurement.stddev$Measurement)

# Merge data frames having mean and std.dev values into one data frame called tidy.data.
# Tidy.data only contains variables, for which both a mean value and a std.dev value is
# found in the raw data.

# Structure of tidy.data: 33 x 3 data frame; 1st column indicates the measured Quantity,
# 2nd and 3rd column indicates the respective mean and std.dev value, respectively.

final.data<-inner_join(measurement.means, measurement.stddev, by="Measurement")
final.data$Mean<-as.numeric(final.data$Mean)
final.data$StdDev<-as.numeric(final.data$StdDev)

return(final.data)

}
