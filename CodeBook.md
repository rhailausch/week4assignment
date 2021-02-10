---
title: "Codebook for the week 4 assignment"
date: "February 7, 2021"
output:
  html_document:
    keep_md: yes
---

## Project Description
The purpose of this proect was to use the data from the Human Activity Recognition Using Smartphones Data Set to produce a tidy dataset that contains the average for each subject and for each of the 6 actitvies across all of the mean or standard deviation variables.

##Study design and data processing
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details" (Anguita et al, 2013) (see their website for more details)


##Creating the tidy datafile

###In depth desciption of the run_analysis.R script
1. load the dplyr library
2. download the zip file from this url "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
3. unzip the file
4. read in the the the features.txt file in order to obtain what will become the column names (all of the variable names)
5. read in the test/train files (6 files -- 2 subject,2 X(the actual data),and 2 Y(the labels for what type of activity it was))
6. using rbind, bind the test/train datasets together
7. extract only the datasets that are the mean or standard deviation (had to have mean() or std() in the feature label name -- I did not include    the freqmean or gravitymean, etc )
8. replace the activity labels that were numbers with their descriptions (1 became "walking", etc)
9. combine the subject, activity, and variables into one large dataframe
10. change the column names to be more descriptive ()
11. takes the average across each subject and each activtity and assigns to a new tidy dataset
12. uses write.table to write teh tidy dataset to a .txt file



##Description of the variables in the tidy_data.txt file
General description of the file including:
 - Dimensions of the dataset: 180 x 68 
 - Variables present in the dataset:
   - first column contains the subject identifier (subject id) which is an integer 1-30 (int)
   - the second column contains the type of activity which was one of six possible activities (laying,sitting,standing,walking, walkingupstairs,      walkingdownstairs) (character)
   - the remaining 66 columns contain mean or standard deviations of the various signals collected the from the accelerometer and gyroscope           (num):
      - time: data is in the time domain
      - freq: data is in the frequency domain
      - body: body acceleration
      - gravity: gravitational acceleration
      - acceleration: acceleration
      - angular velocity: angular velocity (measured using the gyroscope)
      - jerk: jerk signals
      - magnitude: magnitude of the signals
      - X: motion in the X direction
      - Y: motion in the Y direction
      - Z: motion in the Z direction
      - mean: mean of the signal
      - std: standard deviation of the signal
      
      
### List of remaining 66 vaiables measured (titled based on the desciptions above)
 - timebodyaccelerationmean
 - timebodyaccelerationmeanY
 - timebodyaccelerationmeanZ
 - timebodyaccelerationstdX
 - timebodyaccelerationstdY
 - timebodyaccelerationstdZ
 - timeGravityaccelerationmeanX
 - timeGravityaccelerationmeanY
 - timeGravityaccelerationmeanZ
 - timeGravityaccelerationstdX
 - timeGravityaccelerationstdY
 - timeGravityaccelerationstdZ
 - timebodyaccelerationjerkmeanX
 - timebodyaccelerationjerkmeanY
 - timebodyaccelerationjerkmeanZ
 - timebodyaccelerationjerkstdX
 - timebodyaccelerationjerkstdY
 - timebodyaccelerationjerkstdZ
 - timebodyangularvelocitymeanX
 - timebodyangularvelocitymeanY
 - timebodyangularvelocitymeanZ
 - timebodyangularvelocitystdX
 - timebodyangularvelocitystdY
 - timebodyangularvelocitystdZ
 - timebodyangularvelocityjerkmeanX
 - timebodyangularvelocityjerkmeanY
 - timebodyangularvelocityjerkmeanZ
 - timebodyangularvelocityjerkstdX
 - timebodyangularvelocityjerkstdY
 - timebodyangularvelocityjerkstdZ
 - timebodyaccelerationmagnitudemean
 - timebodyaccelerationmagnitudestd
 - timeGravityaccelerationmagnitudemean
 - timeGravityaccelerationmagnitudestd
 - timebodyaccelerationjerkmagnitudemean
 - timebodyaccelerationjerkmagnitudestd
 - timebodyangularvelocitymagnitudemean
 - timebodyangularvelocitymagnitudestd
 - timebodyangularvelocityjerkmagnitudemean
 - timebodyangularvelocityjerkmagnitudestd
 - frequencybodyaccelerationmeanX
 - frequencybodyaccelerationmeanY
 - frequencybodyaccelerationmeanZ
 - frequencybodyaccelerationstdX
 - frequencybodyaccelerationstdY
 - frequencybodyaccelerationstdZ
 - frequencybodyaccelerationjerkmeanX
 - frequencybodyaccelerationjerkmeanY
 - frequencybodyaccelerationjerkmeanZ
 - frequencybodyaccelerationjerkstdX"
 - frequencybodyaccelerationjerkstdY
 - frequencybodyaccelerationjerkstdZ
 - frequencybodyangularvelocitymeanX
 - frequencybodyangularvelocitymeanY
 - frequencybodyangularvelocitymeanZ
 - frequencybodyangularvelocitystdX
 - frequencybodyangularvelocitystdY
 - frequencybodyangularvelocitystdZ
 - frequencybodyaccelerationmagnitudemean
 - frequencybodyaccelerationmagnitudestd
 - frequencybodyaccelerationjerkmagnitudemean
 - frequencybodyaccelerationjerkmagnitudestd
 - frequencybodyangularvelocitymagnitudemean
 - frequencybodyangularvelocitymagnitudestd
 - frequencybodyangularvelocityjerkmagnitudemean
 - frequencybodyangularvelocityjerkmagnitudestd     

##Sources
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones