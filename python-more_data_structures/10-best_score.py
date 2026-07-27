#!/usr/bin/python3
"""Find the key with the highest integer value."""


def best_score(a_dictionary):
    """Return the key with the greatest score, or None if unavailable."""
    if not a_dictionary:
        return None
    return max(a_dictionary, key=a_dictionary.get)
