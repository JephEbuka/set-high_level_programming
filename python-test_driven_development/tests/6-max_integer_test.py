#!/usr/bin/python3
"""Unittests for max_integer."""
import unittest
max_integer = __import__('6-max_integer').max_integer

class TestMaxInteger(unittest.TestCase):
    """Test max_integer with common edge cases."""
    def test_ordered(self):
        self.assertEqual(max_integer([1, 2, 3, 4]), 4)
    def test_unordered(self):
        self.assertEqual(max_integer([1, 3, 4, 2]), 4)
    def test_max_first(self):
        self.assertEqual(max_integer([9, 2, 1]), 9)
    def test_single(self):
        self.assertEqual(max_integer([7]), 7)
    def test_empty(self):
        self.assertIsNone(max_integer([]))
    def test_negative(self):
        self.assertEqual(max_integer([-8, -3, -10]), -3)
    def test_mixed(self):
        self.assertEqual(max_integer([-2, 0, 9, -1]), 9)
    def test_duplicate_max(self):
        self.assertEqual(max_integer([5, 2, 5]), 5)

if __name__ == "__main__":
    unittest.main()
