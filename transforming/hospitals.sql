--HOSPITALS

LOAD DATA LOCAL INPATH '/usr/lib/hadoop/hospital_compare/hospitals.csv'
OVERWRITE INTO TABLE hospitals;
