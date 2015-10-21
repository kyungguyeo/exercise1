--AGGREGATE MEAN AND SD FOR:
	--SURVEY RESULTS
	--BASE SCORE
	--CONSISTENCY SCORE
DROP TABLE IF EXISTS summary_scores;
CREATE TABLE summary_scores row format delimited AS SELECT a.survey_avg, a.survey_sd, a.base_avg, a.base_sd, a.consistency_avg, a.consistency_sd FROM (SELECT AVG(s.survey1 + s.survey2 + s.survey3 + s.survey4 + s.survey5 + s.survey6 + s.survey7 + s.survey8 + s.survey9 + s.survey10 + s.survey11 + s.survey12 + s.survey13 + s.survey14 + s.survey15 + s.survey16 + s.survey17 + s.survey18 + s.survey19 + s.survey20 + s.survey21 + s.survey22 + s.survey23 + s.survey24) as survey_avg, STDDEV_POP(s.survey1 + s.survey2 + s.survey3 + s.survey4 + s.survey5 + s.survey6 + s.survey7 + s.survey8 + s.survey9 + s.survey10 + s.survey11 + s.survey12 + s.survey13 + s.survey14 + s.survey15 + s.survey16 + s.survey17 + s.survey18 + s.survey19 + s.survey20 + s.survey21 + s.survey22 + s.survey23 + s.survey24) survey_sd, AVG(s.base_score) base_avg, STDDEV_POP(s.base_score) base_sd, AVG(s.consistency_score) consistency_avg, STDDEV_POP(s.consistency_score) consistency_sd FROM surveys_responses_tr s) a; 

DROP TABLE IF EXISTS state_scores;
CREATE TABLE state_scores row format delimited AS SELECT a.state, a.survey_scores, a.base_scores, a.consistency_scores FROM (SELECT h.state, AVG(s.survey1 + s.survey2 + s.survey3 + s.survey4 + s.survey5 + s.survey6 + s.survey7 + s.survey8 + s.survey9 + s.survey10 + s.survey11 + s.survey12 + s.survey13 + s.survey14 + s.survey15 + s.survey16 + s.survey17 + s.survey18 + s.survey19 + s.survey20 + s.survey21 + s.survey22 + s.survey23 + s.survey24) survey_scores, AVG(s.base_score) base_scores, AVG(s.consistency_score) consistency_scores FROM hospitals h INNER JOIN surveys_responses_tr s ON (s.provider_id = h.provider_id) WHERE s.base_score IS NOT NULL AND s.consistency_score IS NOT NULL GROUP BY h.state) a;

--Z Score for the 3 scores per state
DROP TABLE IF EXISTS state_summary_scores;
CREATE TABLE state_summary_scores row format delimited AS SELECT DISTINCT ss.state, (ss.survey_scores - hs.survey_avg)/hs.survey_sd AS survey_score, (ss.base_scores - hs.base_avg)/hs.base_sd AS base_score, (ss.consistency_scores - hs.consistency_avg)/hs.consistency_sd AS consistency_score FROM state_scores ss CROSS JOIN summary_scores hs;

--Weighted Average for General Score
SELECT a.state, ROUND(a.general_score, 2) FROM (SELECT DISTINCT s.state, (s.survey_score + s.base_score + s.consistency_score)/3 general_score FROM state_summary_scores s ORDER BY general_score desc LIMIT 10) a;