-- Activating Foreign Key
PRAGMA foreign_keys = ON;

-- Tables

CREATE TABLE IF NOT EXISTS stations (
    station_id INTEGER PRIMARY KEY,
    station_name TEXT NOT NULL,
    station_longitude REAL NOT NULL,
    station_latitude REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS trips (
    trip_id INTEGER PRIMARY KEY,
    trip_duration INTEGER,
    start_time TIMESTAMP NOT NULL,
    stop_time TIMESTAMP,
    start_station_id INTEGER NOT NULL,
    end_station_id INTEGER,
    bike_id INTEGER NOT NULL,
    user_type TEXT,
    birth_year INTEGER,
    gender INTEGER,
    FOREIGN KEY (start_station_id) REFERENCES stations(station_id),
    FOREIGN KEY (end_station_id) REFERENCES stations(station_id)
);

CREATE TABLE IF NOT EXISTS weather_station (
    weather_station_id TEXT PRIMARY KEY,
    weather_station_name TEXT
);

CREATE TABLE IF NOT EXISTS weather_data (
    weather_station_id TEXT NOT NULL,
    date TIMESTAMP NOT NULL,
    avg_daily_wind_speed REAL,
    precipitation REAL,
    snowfall REAL,
    snow_depth REAL,
    avg_temp REAL,
    max_temp REAL,
    min_temp REAL,
    fastest_2min_wind_dir REAL,
    fastest_5min_wind_dir REAL,
    fastest_2min_wind_speed REAL,
    fastest_5min_wind_speed REAL,
    PRIMARY KEY (weather_station_id, date),
    FOREIGN KEY (weather_station_id) REFERENCES weather_station(weather_station_id)
);

-- Indexes
CREATE INDEX idx_trips_start_time ON trips(start_time);
CREATE INDEX idx_weather_date ON weather_data(date);
