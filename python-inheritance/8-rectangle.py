#!/usr/bin/python3
"""Module containing a Rectangle derived from BaseGeometry."""

BaseGeometry = __import__('7-base_geometry').BaseGeometry


class Rectangle(BaseGeometry):
    """Rectangle with private width and height."""

    def __init__(self, width, height):
        """Initialize a rectangle with validated dimensions."""
        self.integer_validator("width", width)
        self.integer_validator("height", height)
        self.__width = width
        self.__height = height
