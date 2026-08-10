#!/usr/bin/python3
"""Module for converting class instances to dictionaries."""


def class_to_json(obj):
    """Return the dictionary representation of an object's attributes."""
    return obj.__dict__.copy()
