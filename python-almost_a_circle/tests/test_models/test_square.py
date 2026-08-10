#!/usr/bin/python3
"""Unit tests for Square."""

import unittest

from models.base import Base
from models.rectangle import Rectangle
from models.square import Square


class TestSquare(unittest.TestCase):
    """Test Square."""

    def setUp(self):
        """Reset IDs."""
        Base._Base__nb_objects = 0

    def test_inheritance(self):
        """Test inheritance."""
        self.assertIsInstance(Square(5), Rectangle)

    def test_size(self):
        """Test size."""
        square = Square(5)
        self.assertEqual(square.size, 5)

    def test_size_setter(self):
        """Test size setter."""
        square = Square(5)
        square.size = 10
        self.assertEqual(square.width, 10)
        self.assertEqual(square.height, 10)

    def test_size_invalid(self):
        """Test size validation."""
        square = Square(5)
        with self.assertRaisesRegex(TypeError, "width must be an integer"):
            square.size = "9"

    def test_str(self):
        """Test string representation."""
        square = Square(5, 2, 3, 12)
        self.assertEqual(str(square), "[Square] (12) 2/3 - 5")

    def test_update_args(self):
        """Test args update."""
        square = Square(5)
        square.update(1, 2, 3, 4)
        self.assertEqual(
            square.to_dictionary(),
            {"id": 1, "size": 2, "x": 3, "y": 4}
        )

    def test_update_kwargs(self):
        """Test kwargs update."""
        square = Square(5)
        square.update(id=89, size=7, x=12, y=1)
        self.assertEqual(
            square.to_dictionary(),
            {"id": 89, "size": 7, "x": 12, "y": 1}
        )


if __name__ == "__main__":
    unittest.main()
