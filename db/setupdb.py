import sqlite3
from pathlib import Path

CDIR = Path(__file__).resolve().parents[0]
DB_PATH = CDIR / "citibike.db"
SCHEMA_PATH = CDIR / "schema.sql"

def init_db():
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    with open(SCHEMA_PATH, "r", encoding="utf-8") as f:
        schema_sql = f.read()

    cursor.executescript(schema_sql)

    conn.commit()
    conn.close()

if __name__ == "__main__":
    init_db()
