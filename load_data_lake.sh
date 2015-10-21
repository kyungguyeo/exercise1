cd /root
git clone https://github.com/UC-Berkeley-I-School/w205-labs-exercises.git
cd /root/exercise1/hospital_compare/

tail -n +2 "Hospital General Information.csv" > hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv
tail -n +2 hvbp_hcahps_05_28_2015.csv > surveys_responses.csv
mv "Measure Dates.csv" measure_dates.csv

cd /usr/lib/hadoop/
mkdir exercise1_data
cd exercise1_data
mkdir hospitals
mkdir effective_care
mkdir readmissions
mkdir surveys_responses

hadoop fs -put /root/exercise1/hospital_compare/hospitals.csv /usr/lib/hadoop/exercise1_data/hospitals

hadoop fs -put /root/exercise1/hospital_compare/effective_care.csv /usr/lib/hadoop/exercise1_data/effective_care

hadoop fs -put /root/exercise1/hospital_compare/readmissions.csv /usr/lib/hadoop/exercise1_data/readmissions

hadoop fs -put /root/exercise1/hospital_compare/surveys_responses.csv /usr/lib/hadoop/exercise1_data/surveys_responses
