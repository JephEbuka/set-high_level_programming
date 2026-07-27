#!/usr/bin/python3
"""Convert Roman numerals to integers."""


def roman_to_int(roman_string):
    """Return the integer represented by roman_string, or 0 if invalid type."""
    if not isinstance(roman_string, str) or not roman_string:
        return 0

    values = {'I': 1, 'V': 5, 'X': 10, 'L': 50,
              'C': 100, 'D': 500, 'M': 1000}
    total = 0
    previous = 0

    for character in reversed(roman_string):
        current = values.get(character, 0)
        if current < previous:
            total -= current
        else:
            total += current
            previous = current

    return total
