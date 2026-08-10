#!/usr/bin/python3
"""Defines the Square class."""

from models.rectangle import Rectangle


class Square(Rectangle):
    """Represent a square."""

    def __init__(self, size, x=0, y=0, id=None):
        """Initialize a Square."""
        super().__init__(size, size, x, y, id)

    @property
    def size(self):
        """Return size."""
        return self.width

    @size.setter
    def size(self, value):
        """Set size."""
        self.width = value
        self.height = value

    def __str__(self):
        """Return string representation."""
        return "[Square] ({}) {}/{} - {}".format(
            self.id, self.x, self.y, self.size
        )

    def update(self, *args, **kwargs):
        """Update attributes."""
        attributes = ["id", "size", "x", "y"]

        if args:
            for attribute, value in zip(attributes, args):
                setattr(self, attribute, value)
        else:
            for attribute, value in kwargs.items():
                if attribute in attributes:
                    setattr(self, attribute, value)

    def to_dictionary(self):
        """Return dictionary representation."""
        return {
            "id": self.id,
            "size": self.size,
            "x": self.x,
            "y": self.y
        }
