SELECT
	h.state
	,AVG(a.score) as avg_score
FROM
	(
	SELECT 
		e.provider_id
		,e.score +.4*r.score as agg_score
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
GROUP BY 
	h.state
ORDER BY 
	avg_score DESC
LIMIT 10;