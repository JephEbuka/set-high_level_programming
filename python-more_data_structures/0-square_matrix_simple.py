#!/usr/bin/python3
"""Compute the square of every integer in a matrix."""


def square_matrix_simple(matrix=[]):
    """Return a new matrix containing the square of each value."""
    return [[value ** 2 for value in row] for row in matrix]
