cd ~/Desktop
wget -O Hospital_Flatfiles.zip https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip
mkdir Hospital_Flatfiles
mv "Hospital_Flatfiles.zip" Hospital_Flatfiles
cd Hospital_Flatfiles
unzip "Hospital_Flatfiles.zip"

tail -n +2 "Hospital General Information.csv" > hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv
tail -n +2 hvbp_hcahps_05_28_2015.csv > surveys_responses.csv
mv "Measure Dates.csv" measure_dates.csv

hadoop fs -mkdir /exercise1_data
hadoop fs -mkdir /exercise1_data/hospitals
hadoop fs -mkdir /exercise1_data/effective_care
hadoop fs -mkdir /exercise1_data/readmissions
hadoop fs -mkdir /exercise1_data/surveys_responses

hadoop fs -put ~/Desktop/Hospital_Flatfiles/hospitals.csv /exercise1_data/hospitals
hadoop fs -put ~/Desktop/Hospital_Flatfiles/effective_care.csv /exercise1_data/effective_care
hadoop fs -put ~/Desktop/Hospital_Flatfiles/readmissions.csv /exercise1_data/readmissions
hadoop fs -put ~Desktop/Hospital_Flatfiles/surveys_responses.csv /exercise1_data/surveys_responses