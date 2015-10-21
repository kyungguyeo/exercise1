What hospitals are models of high-quality care—that is, which hospitals have the most consistently high scores for a variety of procedures?

For this problem I worked primarily withe hospital survey results (hvbp_hcahps_05_28_2015.csv). In this table there are 24 survey questions, a base score, and a consistency score for each hospital. To make sure that the measure of high-quality care takes into account every aspect of these scores and survey results, I took a weight average of the 3 different types of scores. For survey results, I first calculated the decimal score for each survey result (Eg: 0.1 for "1 out of 10"), then took the sum of all 24 survey results to get an aggregate survey result for the hospital.

I did this by first deriving the mean and standard deviation for survey results, base score, and consistency scores, as storing it into a temp table called summary_scores. Then I used those summary scores to create z scores for each hospital, by subtracting each hospital's score by the mean, then dividing that by the standard deviation. Lastly, now that all 3 scores are standardized to each other, I took the average of them to create 1 general score for each hospital. As expected, the distribution for these scores has a mean of 0 and a standard deviation of 1, so a score over 2, for example, represents a strong deviation away from the mean. Here are the scores for the top 10 best performing hospitals:

provider_id	hospital_name	general_score
250009	MAGNOLIA REGIONAL HEALTH CENTER	2.09
420015	BAPTIST EASLEY HOSPITAL	2.08
250057	KING'S DAUGHTERS MEDICAL CENTER-BROOKHAVEN	2.02
340145	CAROLINAS HEALTHCARE SYSTEM LINCOLN	2.0
120006	CASTLE MEDICAL CENTER	1.98
520049	BELLIN MEMORIAL HOSPITAL	1.97
360056	MERCY HOSPITAL FAIRFIELD	1.94
330162	NORTHERN WESTCHESTER HOSPITAL	1.93
160147	GRINNELL REGIONAL MEDICAL CENTER	1.92
370228	BAILEY MEDICAL CENTER, LLC	1.92

A hospital that reflects high-quality care should have the highest average scores for every aspect of care, and this is well-reflected through the base score, the consistency score, and the survey results. Because it is difficult at this level of analysis to tell how the scores should be weighed in relation to one another, I decided to weigh all three scores equally when calculating general score, but in the future that is a feature that can be iterated upon.