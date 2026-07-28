#!/usr/bin/python3
def divisible_by_2(my_list=[]):
    """Return whether each number in a list is divisible by two."""
    return [number % 2 == 0 for number in my_list]
