#!/usr/bin/python3
def print_list_integer(my_list=[]):
    """Print each integer in a list on its own line."""
    for number in my_list:
        print("{:d}".format(number))
