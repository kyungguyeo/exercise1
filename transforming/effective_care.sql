--EFFECTIVE CARE
DROP TABLE IF EXISTS effective_care_tr;
CREATE TABLE effective_care_tr row format delimited AS SELECT provider_id, measure_id, condition, measure_name, CAST(score AS INT), sample, footnote, CAST(measure_start_date AS DATE), CAST(measure_end_date AS DATE) FROM effective_care;