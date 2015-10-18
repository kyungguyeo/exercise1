SELECT
	AVG(CORR(sr.communication_with_nurses_achievement_points, a.score), CORR(sr.communication_with_nurses_improvement_points, a.score), CORR(sr.communication_with_nurses_dimension_score, a.score), CORR(sr.communication_with_doctors_achievement_points, a.score), CORR(sr.communication_with_doctors_improvement_points, a.score), CORR(sr.communication_with_doctors_dimension_score, a.score), CORR(sr.responsiveness_of_hospital_staff_achievement_points, a.score), CORR(sr.responsiveness_of_hospital_staff_improvement_points, a.score), CORR(sr.responsiveness_of_hospital_staff_dimension_score, a.score), CORR(sr.pain_management_achievement_points, a.score), CORR(sr.pain_management_improvement_points, a.score), CORR(sr.pain_management_dimension_score, a.score), CORR(sr.communication_about_medicines_achievement_points, a.score), CORR(sr.communication_about_medicines_improvement_points, a.score), CORR(sr.communication_about_medicines_dimension_score, a.score), CORR(sr.cleanliness_and_quietness_of_hospital_environment_achievement_points, a.score), CORR(sr.cleanliness_and_quietness_of_hospital_environment_improvement_points, a.score), CORR(sr.cleanliness_and_quietness_of_hospital_environment_dimension_score, a.score), CORR(sr.discharge_information_achievement_points, a.score), CORR(sr.discharge_information_improvement_points, a.score), CORR(sr.discharge_information_dimension_score, a.score), CORR(sr.overall_rating_of_hospital_achievement_points, a.score), CORR(sr.overall_rating_of_hospital_improvement_points, a.score), CORR(sr.overall_rating_of_hospital_dimension_score, a.score), CORR(sr.hcahps_base_score, a.score), CORR(sr.hcahps_consistency_score, a.score)) agg_corr
FROM
	(
	SELECT 
		e.provider_id
		,.6*e.score +.4*r.score as agg_score
	FROM 
		effective_care_tr e 
		JOIN
		readmissions_tr r
		ON (e.provider_id = r.provider_id)
	WHERE 
		e.score <> 'Not Available'
		AND
		r.score <> 'Not Available'
	ORDER BY 
		e.score DESC
	LIMIT 10
	) a
	JOIN
	hospitals_tr h
	ON (a.provider_id = h.provider_id)
	JOIN 
	surveys_responses_tr sr
	ON (h.provider_id = sr.provider_id)
ORDER BY 
	a.agg_corr DESC
LIMIT 10;