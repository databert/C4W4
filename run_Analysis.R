run_Analysis <- function(){
  
# load library for better data handling
library(dplyr)

# load train and test data. Make Sure data is working directory

if (!file.exists("X_test.txt")){
  stop('X_test.txt not found')
}
else if (!file.exists("X_train.txt")){
  stop('X_train.txt not found')
}
else if (!file.exists("features.txt")){
  stop('features.txt not found')
}
else{
  test<-tbl_df(read.table("X_test.txt", sep=""))
  train<-tbl_df(read.table("X_train.txt", sep=""))
}
# combine data sets
full<-rbind(train, test)

# read in features from previously loaded files
features<-tbl_df(read.table("features.txt", sep=""))

# Execute data clean-up script and store result in 'tidy.data'
tidy.data<<-TidyData(full, features)

#Save tidy data as a text file
write.table(tidy.data, "tidydata.txt", row.name=FALSE)
}