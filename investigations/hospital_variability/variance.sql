SELECT
	h.provider_id
	,h.hospital_name
	,variance(e.score) var
FROM
	effective_care_tr e
	JOIN 
	hospitals_tr h
	ON (e.provider_id = h.provider_id)
WHERE
	e.score <> 'Not Available'
GROUP BY 
	h.provider_id, h.hospital_name
ORDER BY 
	var desc
LIMIT 10