# exercise1
w205 Exercise1

###SetUp and Loading in the Data

Run:
```
git clone https://github.com/kyungguyeo/exercise1.git
cd exercise1
chmod u+x load_data_lake.sh
./load_data_lake.sh
```
Data will be loaded onto Desktop. Then run hive -f hive_base_ddl.sql. This will create the database schemas and point it to the appropriate hdfs files.


###Data Transformation
To transform the data into tables to match my ER diagram:
```
cd transforming
hive -f effective_care.sql
hive -f readmissions.sql
hive -f surveys.sql
```

###Analysis
To run the analyses, change directories to investigations, and in the best_hospitals, best_states, hospital_variability, and hospitals_and_patients folders, run each of the sql queries. Each of these queries will return values to answer the associated questions.

###ER diagram
Under loading_and_modeling is a simple er diagram of the data architecture used for this project, displayed below: 
![ER Diagram](/loading_and_modeling/ex1_er_diagram.png)