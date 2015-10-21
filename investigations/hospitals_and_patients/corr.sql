--Correlation Between Hospital Quality Scores (base_score and consistency_score) and Survey Scores
SELECT ROUND(CORR(CAST(a.survey_score AS DOUBLE), CAST(a.quality_score AS DOUBLE)),2) as corr FROM (SELECT DISTINCT h.provider_id, h.hospital_name, h.survey_score, (h.base_score + h.consistency_score)/2 quality_score FROM hospital_summary_scores h) a;

--Correlation Between Variance in Procedure and Survey Scores
SELECT ROUND(CORR(CAST(h.survey_score AS DOUBLE), CAST(a.sd AS DOUBLE)),2) as corr FROM (SELECT provider_id, STDDEV_POP(score) as sd FROM effective_care_tr GROUP BY provider_id) a INNER JOIN hospital_summary_scores h ON (a.provider_id = h.provider_id);