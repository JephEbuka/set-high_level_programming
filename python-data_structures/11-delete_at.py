#!/usr/bin/python3
def delete_at(my_list=[], idx=0):
    """Delete the element at idx when the index is valid."""
    if 0 <= idx < len(my_list):
        del my_list[idx]
    return my_list
