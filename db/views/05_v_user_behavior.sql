CREATE VIEW IF NOT EXISTS v_user_behavior AS
SELECT
    user_type,
    COUNT(*) AS trip_count,
    COUNT(DISTINCT DATE(start_time)) AS active_days,
    ROUND(CAST(trip_count AS REAL) / active_days, 2) AS avg_daily_trips,
    ROUND(AVG(trip_duration), 2) AS avg_trip_duration,
    MIN(trip_duration) AS min_trip_duration,
    MAX(trip_duration) AS max_trip_duration
FROM trips
WHERE user_type IS NOT NULL
GROUP BY user_type;
