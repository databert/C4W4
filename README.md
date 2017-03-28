# C4W4
This Readme provides details on the data loading, cleaning and subsetting procedures performed in the two scripts 'run_Analysis.R' and 'TidyData.R'. In order to load and clean the data as well as to obtain the desired tidy data set, only the command 'run_Analysis()' has to be executed in the R command line. Please make sure the data files 'X_train.txt' and 
'X_test.txt' as well as the feature file 'features.txt' are found in the current working directory, otherwise the script will stop execution.

A) Script 'run_Analysis.R'

Upon executing this script, it searches for the data files 'X_test.txt' and 'X_train.txt' as well as the feature file 'features.txt' in the current wd and stops if files are not found. If files are found, the raw data are loaded into the R workspace as data frames called 'train' and 'test'.

In order to obtain a large number of observations 'train' and 'test' are combined to a complete data frame 'full'.

The features are loaded into a data frame called 'feature.names'.

In the next step the script 'TidyData.R' is executed, which returns a data frame with the tidy and processed data called 'tidy.data.

Lastly, the tidy data are stored in the local working directory as the file 'tidydata.txt'

B) Script 'TidyData.R'

This script performs all relevant data cleaning, subsetting and processing steps in order to obtain the tidy data set. Its execution requires the existence of the data frame 'full' and 'fature.names'.

i)    Subsetting raw data
        The data 'full' is subsetted so as to extract the variables that correspond to the mean and standard deviation value
        of each measurement type. The extraced variables are stored in the data frames 'mean.vars' and 'std.vars'              
        respectively.
        
ii)   Calculating mean value for variables
        For each subsetted variable, the average column value is calculated and stored in 'avg.means' and 'avg.std'. Each of  
        these data frames contains two columns "Measurement" as well as "Mean" and "StdDev", respectively. Each row   
        corresponds to one variable of the raw data set containing the respective column-averaged mean and standard deviation 
        values, respectively.
        
iii)    Creating readible variable names
        In order to create human-readible variable names and join the data frames 'avg.means' and 'avg.std', 'feature.names' 
        is modified, such that it only contains the measurement type, e.g. 'tBodyAccX', but not any special characters, e.g. 
        "-" or "()" or relation to the raw data variable, e.g. "tBodyAccX-means()-X".
        
vi)   Merging data into final data set
        The data frames 'avg.means' and 'std.means' are merged into a final data set called 'tidy.data', which contains the   
        columns 'Measurement', 'Mean' and 'StdDev'
        

