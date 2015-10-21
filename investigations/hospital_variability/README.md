Which procedures have the greatest variability between hospitals?

The variance of the hospital procedures can be found by checking the variance of the procedure scores. By grouping by hospital measure id, we can see which procedures had the highest variances. I added range_score, a simple subtraction between the max score and the min score, to show just how much the scores varied for these procedures across hospitals. The maximum score for all procedures is 1180 and the minimum score is 0.

| measure_id | sd_score | range_score |
|------------|----------|-------------|
| ED_1b      | 92.83    | 1127        |
| ED_2b      | 62.17    | 1132        |
| OP_18b     | 40.70    | 399         |
| OP_3b      | 29.48    | 200         |
| STK_4      | 21.95    | 100         |
| OP_23      | 21.84    | 100         |
| AMI_7a     | 18.78    | 46          |
| OP_2       | 18.05    | 73          |
| OP_21      | 17.72    | 170         |
| OP_20      | 16.88    | 143         |