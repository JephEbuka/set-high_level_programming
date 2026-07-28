#!/usr/bin/python3
"""Define a printable square whose string form matches my_print."""


class Square:
    """Represent a square."""

    def __init__(self, size=0, position=(0, 0)):
        """Initialize a square."""
        self.size = size
        self.position = position

    @property
    def size(self):
        """Return the square size."""
        return self.__size

    @size.setter
    def size(self, value):
        """Set and validate the square size."""
        if type(value) is not int:
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    @property
    def position(self):
        """Return the square position."""
        return self.__position

    @position.setter
    def position(self, value):
        """Set and validate the square position."""
        valid = (isinstance(value, tuple) and len(value) == 2
                 and all(type(x) is int and x >= 0 for x in value))
        if not valid:
            raise TypeError("position must be a tuple of 2 positive integers")
        self.__position = value

    def area(self):
        """Return the square area."""
        return self.__size ** 2

    def __str__(self):
        """Return the square drawing as a string."""
        if self.__size == 0:
            return ""
        lines = [""] * self.__position[1]
        row = " " * self.__position[0] + "#" * self.__size
        lines.extend(row for _ in range(self.__size))
        return "\n".join(lines)

    def my_print(self):
        """Print the square using its size and position."""
        print(self)
