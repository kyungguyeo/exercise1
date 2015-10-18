--EFFECTIVE CARE
DROP TABLE IF EXISTS effective_care_tr;
CREATE TABLE effective_care_tr row format delimited AS SELECT provider_id, measure_id, condition, measure_name, score, sample, footnote, measure_start_date, measure_end_date FROM effective_care;