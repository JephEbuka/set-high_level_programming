#!/usr/bin/python3
def no_c(my_string):
    """Return a copy of a string without c or C characters."""
    return "".join(char for char in my_string if char not in "cC")
