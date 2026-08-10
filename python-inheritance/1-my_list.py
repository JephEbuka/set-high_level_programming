#!/usr/bin/python3
"""Module containing a list subclass."""


class MyList(list):
    """List subclass with a method that prints a sorted copy."""

    def print_sorted(self):
        """Print the list in ascending order without changing the original."""
        print(sorted(self))
