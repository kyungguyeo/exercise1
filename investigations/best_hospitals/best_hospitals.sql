SELECT
	h.hospital_name
	,a.score
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
ORDER BY 
	a.score DESC
LIMIT 10;

