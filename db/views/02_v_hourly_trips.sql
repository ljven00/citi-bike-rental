-- View of the trips by hour
CREATE VIEW IF NOT EXISTS v_hourly_trips AS
SELECT CAST(STRFTIME('%H', start_time) AS INTEGER) AS start_hour,
    COUNT(*) AS trip_count,
    ROUND(AVG(trip_duration), 2) AS avg_trip_duration
FROM trips
GROUP BY start_hour
ORDER BY trip_count DESC;
