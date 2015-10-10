cd /root/exercise1/hospital_compare/

tail -n +2 "Hospital General Information.csv" > hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv
tail -n +2 hvbp_hcahps_05_28_2015.csv > surveys_responses.csv
mv "Measure Dates.csv" measure_dates.csv

$HADOOP_HOME/bin/hadoop fs -put /root/exercise1/hospital_compare .
