#!/usr/bin/python3
"""Print a dictionary in key order."""


def print_sorted_dictionary(a_dictionary):
    """Print first-level dictionary entries sorted by key."""
    for key in sorted(a_dictionary):
        print("{}: {}".format(key, a_dictionary[key]))
