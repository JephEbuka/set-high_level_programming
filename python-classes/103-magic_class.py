#!/usr/bin/python3
"""Recreate the supplied MagicClass bytecode behavior."""

import math


class MagicClass:
    """Represent a circle."""

    def __init__(self, radius=0):
        """Initialize and validate a circle radius."""
        self.__radius = 0
        if type(radius) is not int and type(radius) is not float:
            raise TypeError("radius must be a number")
        self.__radius = radius

    def area(self):
        """Return the circle area."""
        return self.__radius ** 2 * math.pi

    def circumference(self):
        """Return the circle circumference."""
        return 2 * math.pi * self.__radius
