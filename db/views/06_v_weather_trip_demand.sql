-- View that shows weather influences on daily trips
CREATE VIEW IF NOT EXISTS v_weather_trip_demand AS
SELECT
    d.trip_date,
    d.total_trips,
    d.avg_trip_duration,
    w.avg_temp,
    w.max_temp,
    w.min_temp,
    w.precipitation,
    w.snowfall,
    w.avg_daily_wind_speed
FROM v_daily_trips d
JOIN weather_data w
    ON d.trip_date = DATE(w.date);
