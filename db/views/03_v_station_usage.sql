-- View that shows station usage
CREATE VIEW IF NOT EXISTS v_station_usage AS
WITH start_trips AS (
    SELECT start_station_id AS station_id, 
        COUNT(*) AS start_trip_count
    FROM trips
    GROUP BY station_id
), 
end_trips AS (
    SELECT end_station_id AS station_id, 
        COUNT(*) AS end_trip_count
    FROM trips
    WHERE end_station_id IS NOT NULL
    GROUP BY station_id
)
SELECT s.station_id, s.station_name,
    COALESCE(st.start_trip_count, 0) AS start_trip_count,
    COALESCE(et.end_trip_count, 0) AS end_trip_count,
    COALESCE(st.start_trip_count, 0) + 
        COALESCE(et.end_trip_count, 0) AS total_trip_count
FROM stations s
LEFT JOIN start_trips st
    ON s.station_id = st.station_id
LEFT JOIN end_trips et
    ON s.station_id = et.station_id
ORDER BY total_trip_count DESC;