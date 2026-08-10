#!/usr/bin/python3
"""Module for dividing all numeric elements of a matrix."""

def matrix_divided(matrix, div):
    """Return a new matrix whose elements are divided by div."""
    msg = "matrix must be a matrix (list of lists) of integers/floats"
    if (not isinstance(matrix, list) or matrix == [] or
            not all(isinstance(row, list) for row in matrix) or
            not all(all(isinstance(v, (int, float)) for v in row)
                    for row in matrix)):
        raise TypeError(msg)
    size = len(matrix[0])
    if not all(len(row) == size for row in matrix):
        raise TypeError("Each row of the matrix must have the same size")
    if not isinstance(div, (int, float)):
        raise TypeError("div must be a number")
    if div == 0:
        raise ZeroDivisionError("division by zero")
    return [[round(v / div, 2) for v in row] for row in matrix]
