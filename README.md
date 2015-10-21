# exercise1
w205 Exercise1

1. Download the hospital data from https://data.medicare.gov/data/hospital-compare. 

2. Unzip file, then go into the Hospital_Revised_Flatfiles folder directory.

3. From that directory, run load_data_lake.sh - this will pull out the datasets we're using, delete the first rows from these datasets, rename them, and then push them to hdfs.

4. Run hive -f hive_base_ddl.sql. This will create the database schemas and point it to the appropriate hdfs files.

5. Change directories to transforming and run:
	hive -f effective_care.sql
	hive -f readmissions.sql
	hive -f surveys.sql
These transformations will create views that will be used for analysis.

6. Change directories to investigations, and in the best_hospitals, best_states, hospital_variability, and hospitals_and_patients folders, run each of the sql queries. Each of these queries will return values to answer the associated questions.

7. Under loading_and_modeling is a simple er diagram of the data architecture used for this project.