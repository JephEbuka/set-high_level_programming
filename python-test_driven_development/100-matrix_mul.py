#!/usr/bin/python3
"""Module for multiplying two matrices."""

def matrix_mul(m_a, m_b):
    """Multiply two matrices after validation."""
    if not isinstance(m_a, list):
        raise TypeError("m_a must be a list")
    if not isinstance(m_b, list):
        raise TypeError("m_b must be a list")
    if not all(isinstance(row, list) for row in m_a):
        raise TypeError("m_a must be a list of lists")
    if not all(isinstance(row, list) for row in m_b):
        raise TypeError("m_b must be a list of lists")
    if m_a == [] or all(row == [] for row in m_a):
        raise ValueError("m_a can't be empty")
    if m_b == [] or all(row == [] for row in m_b):
        raise ValueError("m_b can't be empty")
    if not all(all(isinstance(v, (int, float)) for v in row) for row in m_a):
        raise TypeError("m_a should contain only integers or floats")
    if not all(all(isinstance(v, (int, float)) for v in row) for row in m_b):
        raise TypeError("m_b should contain only integers or floats")
    a_cols = len(m_a[0])
    if not all(len(row) == a_cols for row in m_a):
        raise TypeError("each row of m_a must be of the same size")
    b_cols = len(m_b[0])
    if not all(len(row) == b_cols for row in m_b):
        raise TypeError("each row of m_b must be of the same size")
    if a_cols != len(m_b):
        raise ValueError("m_a and m_b can't be multiplied")
    return [[sum(m_a[i][k] * m_b[k][j] for k in range(a_cols))
             for j in range(b_cols)] for i in range(len(m_a))]
