WITH cohorts AS (
    SELECT user_id, DATE_TRUNC('month', registration_date) AS cohort_month
    FROM users
),
activity AS (
    SELECT c.cohort_month, DATE_TRUNC('month', o.order_date) AS active_month, COUNT(DISTINCT o.user_id) AS user_count
    FROM cohorts c
    JOIN orders o ON c.user_id = o.user_id
    GROUP BY 1, 2
)
SELECT 
    cohort_month, 
    active_month, 
    user_count as returning_users
FROM activity;