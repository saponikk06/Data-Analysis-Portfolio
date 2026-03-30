SELECT 
    event_type, 
    COUNT(DISTINCT user_id) as unique_users,
    ROUND(100.0 * COUNT(DISTINCT user_id) / FIRST_VALUE(COUNT(DISTINCT user_id)) OVER (ORDER BY MIN(event_timestamp)), 2) as conversion_rate
FROM shop_events
GROUP BY event_type
ORDER BY MIN(event_timestamp);