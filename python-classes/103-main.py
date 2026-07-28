#!/usr/bin/python3
MagicClass = __import__('103-magic_class').MagicClass
circle = MagicClass(3)
print('{:.2f}'.format(circle.area()))
print('{:.2f}'.format(circle.circumference()))
