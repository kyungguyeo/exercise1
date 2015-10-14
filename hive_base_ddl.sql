--HOSPITALS

DROP TABLE hospitals;

CREATE EXTERNAL TABLE hospitals (PROVIDER_ID varchar(500), HOSPITAL_NAME varchar(500), ADDRESS varchar(500), CITY varchar(500), STATE varchar(500), ZIP_CODE varchar(500), COUNTY_NAME varchar(500), PHONE_NUMBER varchar(500), HOSPITAL_TYPE varchar(500), HOSPITAL_OWNERSHIP varchar(500), EMERGENCY_SERVICES varchar(500)) 
row format delimited
fields terminated by ','
stored as textfile
LOCATION '/path/in/hdfs/';

--EFFECTIVE CARE
DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care (PROVIDER_ID varchar(500),HOSPITAL_NAME varchar(500),ADDRESS varchar(500),CITY varchar(500),STATE varchar(500),ZIP_CODE varchar(500),COUNTY_NAME varchar(500),PHONE_NUMBER varchar(500),CONDITION varchar(500),MEASURE_ID varchar(500),MEASURE_NAME varchar(500),SCORE varchar(500),SAMPLE varchar(500),FOOTNOTE varchar(500),MEASURE_START_DATE varchar(500),MEASURE_END_DATE varchar(500))
row format delimited
fields terminated by ','
stored as textfile
LOCATION '/path/in/hdfs/';

--READMISSIONS
DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions (PROVIDER_ID varchar(500),HOSPITAL_NAME varchar(500),ADDRESS varchar(500),CITY varchar(500),STATE varchar(500),ZIP_CODE varchar(500),COUNTY_NAME varchar(500),PHONE_NUMBER varchar(500),CONDITION varchar(500),MEASURE_NAME varchar(500),MEASURE_ID varchar(500), COMPARED_TO_NATIONAL varchar(500), DENOMINATOR varchar(500), SCORE varchar(500), LOWER_ESTIMATE varchar(500), HIGHER_ESTIMATE varchar(500), FOOTNOTE varchar(500),MEASURE_START_DATE varchar(500),MEASURE_END_DATE varchar(500))
row format delimited
fields terminated by ','
stored as textfile
LOCATION '/path/in/hdfs/';
