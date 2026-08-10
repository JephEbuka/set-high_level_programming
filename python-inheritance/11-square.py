#!/usr/bin/python3
"""Module containing a printable Square."""

Rectangle = __import__('9-rectangle').Rectangle


class Square(Rectangle):
    """Square with a validated private size."""

    def __init__(self, size):
        """Initialize a square with a validated size."""
        self.integer_validator("size", size)
        self.__size = size
        super().__init__(size, size)

    def area(self):
        """Return the square area."""
        return self.__size ** 2

    def __str__(self):
        """Return the printable square description."""
        return "[Square] {}/{}".format(self.__size, self.__size)
