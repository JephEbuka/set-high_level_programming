#!/usr/bin/python3
"""Delete a dictionary key when it exists."""


def simple_delete(a_dictionary, key=""):
    """Remove key from a_dictionary and return the dictionary."""
    if key in a_dictionary:
        del a_dictionary[key]
    return a_dictionary
