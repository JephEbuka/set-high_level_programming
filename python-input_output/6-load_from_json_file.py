#!/usr/bin/python3
"""Module for loading objects from JSON files."""
import json


def load_from_json_file(filename):
    """Create and return a Python object from a JSON file."""
    with open(filename, "r", encoding="utf-8") as file:
        return json.load(file)
