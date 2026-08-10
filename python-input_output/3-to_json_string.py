#!/usr/bin/python3
"""Module for converting Python objects to JSON strings."""
import json


def to_json_string(my_obj):
    """Return the JSON string representation of my_obj."""
    return json.dumps(my_obj)
