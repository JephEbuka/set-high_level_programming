#!/usr/bin/python3
"""Module for saving objects to JSON files."""
import json


def save_to_json_file(my_obj, filename):
    """Write the JSON representation of an object to a file."""
    with open(filename, "w", encoding="utf-8") as file:
        json.dump(my_obj, file)
