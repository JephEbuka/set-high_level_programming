#!/usr/bin/python3
"""Solve the N Queens problem."""

import sys


def is_safe(queens, row, column):
    """Return whether a queen can be placed at row and column."""
    for placed_row, placed_column in queens:
        if placed_column == column:
            return False
        if abs(placed_row - row) == abs(placed_column - column):
            return False
    return True


def solve(n, row=0, queens=None):
    """Generate and print every valid arrangement of N queens."""
    if queens is None:
        queens = []

    if row == n:
        print(queens)
        return

    for column in range(n):
        if is_safe(queens, row, column):
            solve(n, row + 1, queens + [[row, column]])


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: nqueens N")
        sys.exit(1)

    try:
        board_size = int(sys.argv[1])
    except ValueError:
        print("N must be a number")
        sys.exit(1)

    if board_size < 4:
        print("N must be at least 4")
        sys.exit(1)

    solve(board_size)
