#!/usr/bin/python3
"""Read log lines from stdin and compute file-size and status metrics."""
import sys

VALID_CODES = ("200", "301", "400", "401", "403", "404", "405", "500")
total_size = 0
status_counts = {code: 0 for code in VALID_CODES}
line_count = 0


def print_stats():
    """Print accumulated file-size and HTTP status statistics."""
    print("File size: {}".format(total_size))
    for code in VALID_CODES:
        if status_counts[code]:
            print("{}: {}".format(code, status_counts[code]))


try:
    for line in sys.stdin:
        line_count += 1
        parts = line.split()
        if len(parts) >= 2:
            try:
                total_size += int(parts[-1])
            except (ValueError, TypeError):
                pass

            status = parts[-2]
            if status in status_counts:
                status_counts[status] += 1

        if line_count % 10 == 0:
            print_stats()
except KeyboardInterrupt:
    print_stats()
    raise
