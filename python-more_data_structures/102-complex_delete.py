#!/usr/bin/python3
"""Delete dictionary entries by value."""


def complex_delete(a_dictionary, value):
    """Delete every key whose value equals value and return the dictionary."""
    for key in list(a_dictionary.keys()):
        if a_dictionary[key] == value:
            del a_dictionary[key]
    return a_dictionary
