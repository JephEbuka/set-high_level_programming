#!/usr/bin/python3
def max_integer(my_list=[]):
    """Return the largest integer in a list, or None if empty."""
    if len(my_list) == 0:
        return None

    largest = my_list[0]
    for number in my_list[1:]:
        if number > largest:
            largest = number
    return largest
