#!/usr/bin/python3
"""Create a list with selected values replaced."""


def search_replace(my_list, search, replace):
    """Return a new list replacing every occurrence of search."""
    return [replace if value == search else value for value in my_list]
