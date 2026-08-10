#!/usr/bin/python3
"""Module for printing squares made of # characters."""

def print_square(size):
    """Print a square of # characters with side length size."""
    if not isinstance(size, int):
        raise TypeError("size must be an integer")
    if size < 0:
        raise ValueError("size must be >= 0")
    for _ in range(size):
        print("#" * size)
