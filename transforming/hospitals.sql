DROP TABLE IF EXISTS hospitals_tr;
CREATE TABLE hospitals_tr row format delimited AS SELECT * FROM hospitals;