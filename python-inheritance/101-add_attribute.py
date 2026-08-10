#!/usr/bin/python3
"""Module for adding attributes to objects."""


def add_attribute(obj, name, value):
    """Add an attribute if the object supports dynamic attributes."""
    if not hasattr(obj, "__dict__"):
        raise TypeError("can't add new attribute")
    setattr(obj, name, value)
