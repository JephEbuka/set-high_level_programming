#!/usr/bin/python3
"""Display the X-Request-Id response header."""

import sys
import urllib.request


if __name__ == "__main__":
    request = urllib.request.Request(sys.argv[1])

    with urllib.request.urlopen(request) as response:
        print(response.getheader("X-Request-Id"))
