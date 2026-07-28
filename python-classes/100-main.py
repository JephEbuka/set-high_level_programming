#!/usr/bin/python3
SinglyLinkedList = __import__('100-singly_linked_list').SinglyLinkedList
sll = SinglyLinkedList()
for value in (2, 5, 3, 10, 1, -4, -3, 4, 5, 12, 3):
    sll.sorted_insert(value)
print(sll)
