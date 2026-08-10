#!/usr/bin/python3
"""Safely filter states by name."""

import MySQLdb
import sys


if __name__ == "__main__":
    database = MySQLdb.connect(
        host="localhost",
        port=3306,
        user=sys.argv[1],
        passwd=sys.argv[2],
        db=sys.argv[3]
    )
    cursor = database.cursor()

    cursor.execute(
        "SELECT * FROM states "
        "WHERE name = %s "
        "ORDER BY id ASC",
        (sys.argv[4],)
    )

    for row in cursor.fetchall():
        print(row)

    cursor.close()
    database.close()
