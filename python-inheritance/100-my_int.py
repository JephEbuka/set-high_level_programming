#!/usr/bin/python3
"""Module containing a rebel integer class."""


class MyInt(int):
    """Integer subclass with == and != inverted."""

    def __eq__(self, other):
        """Return the opposite of normal integer equality."""
        return int.__ne__(self, other)

    def __ne__(self, other):
        """Return the opposite of normal integer inequality."""
        return int.__eq__(self, other)
