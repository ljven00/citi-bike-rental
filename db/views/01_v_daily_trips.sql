-- View that shows the daily trips
CREATE VIEW IF NOT EXISTS v_daily_trips AS
SELECT DATE(start_time) AS trip_date, COUNT(*) AS total_trips,
    ROUND(AVG(trip_duration), 2) AS avg_trip_duration
FROM trips
GROUP BY trip_date
ORDER BY trip_date;