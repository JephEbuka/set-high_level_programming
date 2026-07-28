#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")"

for file in ./*.py; do
    python3 -m py_compile "$file"
done
printf '[PASS] Python syntax\n'

python3 - <<'PYTEST'
import contextlib
import importlib
import io
import math
import subprocess


def output(script):
    return subprocess.check_output([f'./{script}'], text=True).rstrip('\n')

assert output('0-main.py') == "<class '0-square.Square'>\n{}"
print('[PASS] 0-square.py')
assert output('1-main.py') == (
    "<class '1-square.Square'>\n{'_Square__size': 3}\n"
    "'Square' object has no attribute 'size'\n"
    "'Square' object has no attribute '__size'"
)
print('[PASS] 1-square.py')
assert output('2-main.py') == (
    "<class '2-square.Square'>\n{'_Square__size': 3}\n"
    "<class '2-square.Square'>\n{'_Square__size': 0}\n"
    "'Square' object has no attribute 'size'\n"
    "'Square' object has no attribute '__size'\n"
    "size must be an integer\nsize must be >= 0"
)
print('[PASS] 2-square.py')
assert output('3-main.py') == (
    "Area: 9\n'Square' object has no attribute 'size'\n"
    "'Square' object has no attribute '__size'\nArea: 25"
)
print('[PASS] 3-square.py')
assert output('4-main.py') == (
    'Area: 7921 for size: 89\nArea: 9 for size: 3\n'
    'size must be an integer'
)
print('[PASS] 4-square.py')
assert output('5-main.py') == (
    '###\n###\n###\n--\n' + ('##########\n' * 10) + '--\n\n--'
)
print('[PASS] 5-square.py')
assert output('6-main.py') == (
    '###\n###\n###\n--\n\n ###\n ###\n ###\n--\n'
    '   ###\n   ###\n   ###\n--'
)
print('[PASS] 6-square.py')
assert output('100-main.py') == '-4\n-3\n1\n2\n3\n3\n4\n5\n5\n10\n12'
module = importlib.import_module('100-singly_linked_list')
try:
    module.Node('x')
    raise AssertionError('Node accepted non-integer data')
except TypeError as error:
    assert str(error) == 'data must be an integer'
try:
    module.Node(1).next_node = 3
    raise AssertionError('Node accepted invalid next_node')
except TypeError as error:
    assert str(error) == 'next_node must be a Node object'
print('[PASS] 100-singly_linked_list.py')
assert output('101-main.py') == (
    '#####\n#####\n#####\n#####\n#####\n--\n\n'
    '    #####\n    #####\n    #####\n    #####\n    #####'
)
Square = importlib.import_module('101-square').Square
assert str(Square()) == ''
assert str(Square(2, (2, 2))) == '\n\n  ##\n  ##'
print('[PASS] 101-square.py')
assert output('102-main.py') == (
    'Square 5 < Square 6\nSquare 5 <= Square 6\n'
    'Square 5 != Square 6'
)
for module_name in ('2-square', '3-square', '4-square', '5-square', '6-square', '101-square'):
    TestedSquare = importlib.import_module(module_name).Square
    try:
        TestedSquare(True)
        raise AssertionError(f'{module_name} accepted bool as size')
    except TypeError as error:
        assert str(error) == 'size must be an integer'
Square = importlib.import_module('102-square').Square
assert Square(2) == Square(2.0)
assert Square(3) > Square(2)
try:
    Square('3')
    raise AssertionError('Square accepted invalid size')
except TypeError as error:
    assert str(error) == 'size must be a number'
print('[PASS] 102-square.py')
assert output('103-main.py') == '28.27\n18.85'
MagicClass = importlib.import_module('103-magic_class').MagicClass
circle = MagicClass(3)
assert math.isclose(circle.area(), 9 * math.pi)
assert math.isclose(circle.circumference(), 6 * math.pi)
try:
    MagicClass(True)
    raise AssertionError('MagicClass accepted bool')
except TypeError as error:
    assert str(error) == 'radius must be a number'
print('[PASS] 103-magic_class.py')
PYTEST

if command -v pycodestyle >/dev/null 2>&1; then
    pycodestyle ./*.py
    printf '[PASS] pycodestyle\n'
else
    printf '[SKIP] pycodestyle is not installed\n'
fi

printf '\nAll local tests passed.\n'
