#!/usr/bin/python3
"""Unit tests for Base."""

import os
import unittest

from models.base import Base
from models.rectangle import Rectangle
from models.square import Square


class TestBase(unittest.TestCase):
    """Test Base."""

    def setUp(self):
        """Reset counter and clean generated files."""
        Base._Base__nb_objects = 0
        for filename in (
            "Rectangle.json",
            "Square.json",
            "Rectangle.csv",
            "Square.csv",
        ):
            if os.path.exists(filename):
                os.remove(filename)

    def tearDown(self):
        """Clean generated files."""
        for filename in (
            "Rectangle.json",
            "Square.json",
            "Rectangle.csv",
            "Square.csv",
        ):
            if os.path.exists(filename):
                os.remove(filename)

    def test_auto_ids(self):
        """Test automatic IDs."""
        self.assertEqual(Base().id, 1)
        self.assertEqual(Base().id, 2)

    def test_custom_id(self):
        """Test custom ID."""
        self.assertEqual(Base(12).id, 12)

    def test_json_empty(self):
        """Test empty JSON conversion."""
        self.assertEqual(Base.to_json_string(None), "[]")
        self.assertEqual(Base.to_json_string([]), "[]")

    def test_json_roundtrip(self):
        """Test JSON conversion."""
        data = [{"id": 1}]
        self.assertEqual(
            Base.from_json_string(Base.to_json_string(data)),
            data
        )

    def test_rectangle_create(self):
        """Test Rectangle create."""
        rect = Rectangle(3, 4, 1, 2, 8)
        new = Rectangle.create(**rect.to_dictionary())
        self.assertEqual(new.to_dictionary(), rect.to_dictionary())

    def test_square_create(self):
        """Test Square create."""
        square = Square(5, 1, 2, 8)
        new = Square.create(**square.to_dictionary())
        self.assertEqual(new.to_dictionary(), square.to_dictionary())

    def test_load_missing_json(self):
        """Test missing JSON file."""
        self.assertEqual(Rectangle.load_from_file(), [])

    def test_json_file_roundtrip(self):
        """Test JSON save and load."""
        objects = [Rectangle(2, 3), Rectangle(4, 5, 1, 2)]
        Rectangle.save_to_file(objects)
        loaded = Rectangle.load_from_file()
        self.assertEqual(
            [obj.to_dictionary() for obj in loaded],
            [obj.to_dictionary() for obj in objects]
        )

    def test_csv_roundtrip(self):
        """Test CSV save and load."""
        objects = [Square(2), Square(4, 1, 2)]
        Square.save_to_file_csv(objects)
        loaded = Square.load_from_file_csv()
        self.assertEqual(
            [obj.to_dictionary() for obj in loaded],
            [obj.to_dictionary() for obj in objects]
        )


if __name__ == "__main__":
    unittest.main()
