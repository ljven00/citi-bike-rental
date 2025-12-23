import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DB_PATH = ROOT / "db" / "citibike.db"
VIEWS_DIR = ROOT / "db" / "views"

def build_views():
    if not DB_PATH.exists():
        raise FileNotFoundError(f"Database not found at {DB_PATH}")

    conn = sqlite3.connect(DB_PATH)

    for sql_file in sorted(VIEWS_DIR.glob("*.sql")):
        print(f"Creating view from {sql_file.name}")
        with open(sql_file, "r", encoding="utf-8") as f:
            conn.executescript(f.read())

    conn.commit()
    conn.close()


if __name__ == "__main__":
    build_views()
