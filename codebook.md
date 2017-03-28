This codebook accounts for modifications and transformations on the provided raw data in the process of obtaining a tidy data set
'tidy.data'. Additionally, it provides complete information on the tidy data set. 

i)    Raw data set
        The raw data set is based on the provided data files 'X_test.csv' and 'X_train.csv' as well as the feature file 'features.txt'
    
ii)   Load data in R
        In order to obtain a large number of observations, both data sets are loaded into R
        and merged into one large data set 'full'. The raw data is complete and not further modified. Also, the features of the data set
        containing the variable names is loaded into 'feature.names'.

iii)  Subsetting raw data
        The data 'full' is subsetted so as to extract the variables that correspond to the mean and standard deviation value
        of each measurement type and results are stored in 'mean.vars' and 'std.vars' respectively.
        
iv)   Calculating mean value for variables
        For each subsetted variable, the average column value is calculated and stored in 'avg.means' and 'avg.std'. Each of these
        data frames contains two columns "Measurement" as well as "Mean" and "StdDev", respectively. Each row corresponds to one
        variable of the raw data set containing the respective column-averaged mean and standard deviation values, respectively.
        
v)    Creating readible variable names
        In order to create human-readible variable names and join the data frames 'avg.means' and 'avg.std', 'feature.names' is modified, such that
        it only contains the measurement type, e.g. 'tBodyAccX', but not any special characters, e.g. "-" or "()" or relation to the raw data variable,
        e.g. "tBodyAccX-means()-X".
        
vi)   Merging data into final data set
        The data frames 'avg.means' and 'std.means' are merged into a final data set called 'tidy.data'. 
        
v)    Tidy data set 'tidy.data'
        The final output data of this data cleaning process are stored in 'tidy.data'.
        It should be noted that only measurements for which both mean and standard deviation values were found in the raw data, are contained in this data set; simply from
        statistical point of view, mean values for measurements don't have any meaning without a standard deviation value.
        The list below provides a deailed account for the variable names and the row index in the 'tidy.data' set. 
        
The number corresponds to row index and the text to measurement type
1	  tBodyAccX
2	  tBodyAccY
3	  tBodyAccZ
4	  tGravityAccX
5	  tGravityAccY
6	  tGravityAccZ
7	  tBodyAccJerkX
8	  tBodyAccJerkY
9	  tBodyAccJerkZ
10	tBodyGyroX
11	tBodyGyroY
12	tBodyGyroZ
13	tBodyGyroJerkX
14	tBodyGyroJerkY
15	tBodyGyroJerkZ
16	tBodyAccMag
17	tGravityAccMag
18	tBodyAccJerkMag
19	tBodyGyroMag
20	tBodyGyroJerkMag
21	fBodyAccX
22	fBodyAccY
23	fBodyAccZ
24	fBodyAccJerkX
25	fBodyAccJerkY
26	fBodyAccJerkZ
27	fBodyGyroX
28	fBodyGyroY
29	fBodyGyroZ
30	fBodyAccMag
31	fBodyBodyAccJerkMag
32	fBodyBodyGyroMag
33	fBodyBodyGyroJerkMag
