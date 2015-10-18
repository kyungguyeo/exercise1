--HOSPITALS

DROP TABLE IF EXISTS hospitals;
CREATE EXTERNAL TABLE hospitals (PROVIDER_ID varchar(500), HOSPITAL_NAME varchar(500), ADDRESS varchar(500), CITY varchar(500), STATE varchar(500), ZIP_CODE varchar(500), COUNTY_NAME varchar(500), PHONE_NUMBER varchar(500), HOSPITAL_TYPE varchar(500), HOSPITAL_OWNERSHIP varchar(500), EMERGENCY_SERVICES varchar(500)) 
row format delimited
fields terminated by ','
stored as textfile
LOCATION '/usr/lib/hadoop/exercise1_data/hospitals';

--EFFECTIVE CARE
DROP TABLE IF EXISTS effective_care;
CREATE EXTERNAL TABLE effective_care (PROVIDER_ID varchar(500),HOSPITAL_NAME varchar(500),ADDRESS varchar(500),CITY varchar(500),STATE varchar(500),ZIP_CODE varchar(500),COUNTY_NAME varchar(500),PHONE_NUMBER varchar(500),CONDITION varchar(500),MEASURE_ID varchar(500),MEASURE_NAME varchar(500),SCORE varchar(500),SAMPLE varchar(500),FOOTNOTE varchar(500),MEASURE_START_DATE varchar(500),MEASURE_END_DATE varchar(500))
row format delimited
fields terminated by ','
stored as textfile
LOCATION '/usr/lib/hadoop/exercise1_data/effective_care';

--READMISSIONS
DROP TABLE IF EXISTS readmissions;
CREATE EXTERNAL TABLE readmissions (PROVIDER_ID varchar(500),HOSPITAL_NAME varchar(500),ADDRESS varchar(500),CITY varchar(500),STATE varchar(500),ZIP_CODE varchar(500),COUNTY_NAME varchar(500),PHONE_NUMBER varchar(500),CONDITION varchar(500),MEASURE_NAME varchar(500),MEASURE_ID varchar(500), COMPARED_TO_NATIONAL varchar(500), DENOMINATOR varchar(500), SCORE varchar(500), LOWER_ESTIMATE varchar(500), HIGHER_ESTIMATE varchar(500), FOOTNOTE varchar(500),MEASURE_START_DATE varchar(500),MEASURE_END_DATE varchar(500))
row format delimited
fields terminated by ','
stored as textfile
LOCATION '/usr/lib/hadoop/exercise1_data/readmissions';

--SURVEYS
DROP TABLE IF EXISTS surveys_responses;
CREATE EXTERNAL TABLE surveys_responses (Provider_ID VARCHAR(500), Hospital_Name VARCHAR(500), Address VARCHAR(500), City VARCHAR(500), State VARCHAR(500), ZIP_Code VARCHAR(500), County_Name VARCHAR(500), Communication_with_Nurses_Achievement_Points VARCHAR(500), Communication_with_Nurses_Improvement_Points VARCHAR(500), Communication_with_Nurses_Dimension_Score VARCHAR(500), Communication_with_Doctors_Achievement_Points VARCHAR(500), Communication_with_Doctors_Improvement_Points VARCHAR(500), Communication_with_Doctors_Dimension_Score VARCHAR(500), Responsiveness_of_Hospital_Staff_Achievement_Points VARCHAR(500), Responsiveness_of_Hospital_Staff_Improvement_Points VARCHAR(500), Responsiveness_of_Hospital_Staff_Dimension_Score VARCHAR(500), Pain_Management_Achievement_Points VARCHAR(500), Pain_Management_Improvement_Points VARCHAR(500), Pain_Management_Dimension_Score VARCHAR(500), Communication_about_Medicines_Achievement_Points VARCHAR(500), Communication_about_Medicines_Improvement_Points VARCHAR(500), Communication_about_Medicines_Dimension_Score VARCHAR(500), Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_Points VARCHAR(500), Cleanliness_and_Quietness_of_Hospital_Environment_Improvement_Points VARCHAR(500), Cleanliness_and_Quietness_of_Hospital_Environment_Dimension_Score VARCHAR(500), Discharge_Information_Achievement_Points VARCHAR(500), Discharge_Information_Improvement_Points VARCHAR(500), Discharge_Information_Dimension_Score VARCHAR(500), Overall_Rating_of_Hospital_Achievement_Points VARCHAR(500), Overall_Rating_of_Hospital_Improvement_Points VARCHAR(500), Overall_Rating_of_Hospital_Dimension_Score VARCHAR(500), HCAHPS_Base_Score VARCHAR(500), HCAHPS_Consistency_Score VARCHAR(500))
row format delimited
fields terminated by ','
stored as textfile
LOCATION '/usr/lib/hadoop/exercise1_data/surveys_responses';