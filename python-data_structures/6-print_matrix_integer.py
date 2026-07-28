#!/usr/bin/python3
def print_matrix_integer(matrix=[[]]):
    """Print a matrix of integers."""
    for row in matrix:
        for index in range(len(row)):
            ending = "" if index == len(row) - 1 else " "
            print("{:d}".format(row[index]), end=ending)
        print()
