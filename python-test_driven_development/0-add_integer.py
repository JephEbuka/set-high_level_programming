#!/usr/bin/python3
"""Addition module.

Contains the add_integer function.
It validates integer and float values.
Floats are converted to integers before addition."""


def add_integer(a, b=98):
    """Add two integers.

    Floats are converted to integers before addition."""
    if not isinstance(a, (int, float)):
        raise TypeError("a must be an integer")
    if not isinstance(b, (int, float)):
        raise TypeError("b must be an integer")
    return int(a) + int(b)
