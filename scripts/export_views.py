import sqlite3
import pandas as pd
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DB_PATH = ROOT / "db" / "citibike.db"

EXPORT_DIR = ROOT / "exports"
CSV_DIR = EXPORT_DIR / "csv"
PARQUET_DIR = EXPORT_DIR / "parquet"

CSV_DIR.mkdir(parents=True, exist_ok=True)
PARQUET_DIR.mkdir(parents=True, exist_ok=True)

VIEWS = [
    "v_daily_trips",
    "v_hourly_trips",
    "v_station_usage",
    "v_station_imbalance",
    "v_user_behavior",
    "v_weather_trip_demand",
]


def export_views():
    conn = sqlite3.connect(DB_PATH)

    for view in VIEWS:
        df = pd.read_sql(f"SELECT * FROM {view}", conn)

        df.to_csv(CSV_DIR / f"{view}.csv", index=False)
        df.to_parquet(PARQUET_DIR / f"{view}.parquet", index=False)

    conn.close()
    print("All views exported successfully.")

if __name__ == "__main__":
    export_views()
