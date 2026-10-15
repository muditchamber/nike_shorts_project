"""
Nike CSV -> MySQL loader
Does NOT modify the source CSV.

Install:
    pip install pandas mysql-connector-python

Before running, set the MySQL credentials below.
Keep youtube_shorts_tiktok_trends_2025.csv in the same folder as this script.
"""

import os
import pandas as pd
import mysql.connector

CSV_FILE = "youtube_shorts_tiktok_trends_2025.csv"
TABLE_NAME = "nike_trends"

MYSQL_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "PUT_YOUR_MYSQL_PASSWORD_HERE",
    "database": "nike_insights",
}

def get_sql_type(dtype):
    if pd.api.types.is_integer_dtype(dtype):
        return "BIGINT"
    if pd.api.types.is_float_dtype(dtype):
        return "DOUBLE"
    if pd.api.types.is_bool_dtype(dtype):
        return "BOOLEAN"
    if pd.api.types.is_datetime64_any_dtype(dtype):
        return "DATETIME"
    return "TEXT"

def main():
    if not os.path.exists(CSV_FILE):
        raise FileNotFoundError(f"CSV not found: {CSV_FILE}")

    conn = mysql.connector.connect(**MYSQL_CONFIG)
    cursor = conn.cursor()

    df = pd.read_csv(CSV_FILE)
    # Only the in-memory DataFrame is cleaned; the original CSV is untouched.
    df = df.where(pd.notnull(df), None)
    df.columns = [
        c.replace(" ", "_").replace("-", "_").replace(".", "_")
        for c in df.columns
    ]

    columns = ", ".join(
        f"`{c}` {get_sql_type(df[c].dtype)}" for c in df.columns
    )
    cursor.execute(
        f"CREATE TABLE IF NOT EXISTS `{TABLE_NAME}` ({columns})"
    )

    placeholders = ", ".join(["%s"] * len(df.columns))
    column_names = ", ".join(f"`{c}`" for c in df.columns)
    insert_sql = (
        f"INSERT INTO `{TABLE_NAME}` ({column_names}) "
        f"VALUES ({placeholders})"
    )

    rows = [
        tuple(None if pd.isna(x) else x for x in row)
        for row in df.itertuples(index=False, name=None)
    ]

    cursor.executemany(insert_sql, rows)
    conn.commit()

    print(f"Loaded {len(df):,} rows into {TABLE_NAME}.")
    cursor.close()
    conn.close()

if __name__ == "__main__":
    main()
