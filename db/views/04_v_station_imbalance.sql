-- View that shows station imbalance
CREATE VIEW IF NOT EXISTS v_station_imbalance AS
SELECT
    station_id,
    station_name,
    start_trip_count,
    end_trip_count,
    start_trip_count - end_trip_count AS trip_imbalance
FROM v_station_usage
ORDER BY ABS(trip_imbalance) DESC;
