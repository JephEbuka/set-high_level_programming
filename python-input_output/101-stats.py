#!/usr/bin/python3
"""Reads stdin line by line and computes metrics."""
import sys

status_codes = {
    "200": 0,
    "301": 0,
    "400": 0,
    "401": 0,
    "403": 0,
    "404": 0,
    "405": 0,
    "500": 0
}

total_size = 0
line_count = 0


def print_stats():
    """Print accumulated statistics."""
    print("File size: {}".format(total_size))

    for code in sorted(status_codes):
        if status_codes[code] > 0:
            print("{}: {}".format(code, status_codes[code]))


try:
    for line in sys.stdin:
        line_count += 1
        parts = line.split()

        try:
            total_size += int(parts[-1])
        except (ValueError, IndexError):
            pass

        try:
            status = parts[-2]
            if status in status_codes:
                status_codes[status] += 1
        except IndexError:
            pass

        if line_count % 10 == 0:
            print_stats()

except KeyboardInterrupt:
    pass

finally:
    print_stats()
