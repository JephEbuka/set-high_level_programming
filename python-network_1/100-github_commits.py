#!/usr/bin/python3
"""Display the ten most recent commits of a GitHub repository."""

import requests
import sys


if __name__ == "__main__":
    repository = sys.argv[1]
    owner = sys.argv[2]

    url = "https://api.github.com/repos/{}/{}/commits".format(
        owner,
        repository
    )

    response = requests.get(
        url,
        params={"per_page": 10}
    )

    commits = response.json()

    for commit in commits[:10]:
        print("{}: {}".format(
            commit.get("sha"),
            commit.get("commit").get("author").get("name")
        ))
