#!/usr/bin/env bash
set -eu
TARGET="python-import_modules"
rm -rf "$TARGET"
mkdir -p "$TARGET/local-tests"
cat > "$TARGET/0-add.py" <<'EOF_0_ADD_PY'
#!/usr/bin/python3
from add_0 import add


if __name__ == "__main__":
    a = 1
    b = 2
    print("{} + {} = {}".format(a, b, add(a, b)))
EOF_0_ADD_PY
cat > "$TARGET/1-calculation.py" <<'EOF_1_CALCULATION_PY'
#!/usr/bin/python3
from calculator_1 import add, sub, mul, div


if __name__ == "__main__":
    a = 10
    b = 5
    print("{} + {} = {}".format(a, b, add(a, b)))
    print("{} - {} = {}".format(a, b, sub(a, b)))
    print("{} * {} = {}".format(a, b, mul(a, b)))
    print("{} / {} = {}".format(a, b, div(a, b)))
EOF_1_CALCULATION_PY
cat > "$TARGET/100-my_calculator.py" <<'EOF_100_MY_CALCULATOR_PY'
#!/usr/bin/python3
from calculator_1 import add, sub, mul, div
from sys import argv


if __name__ == "__main__":
    if len(argv) != 4:
        print("Usage: ./100-my_calculator.py <a> <operator> <b>")
        raise SystemExit(1)

    a = int(argv[1])
    operator = argv[2]
    b = int(argv[3])

    if operator == "+":
        result = add(a, b)
    elif operator == "-":
        result = sub(a, b)
    elif operator == "*":
        result = mul(a, b)
    elif operator == "/":
        result = div(a, b)
    else:
        print("Unknown operator. Available operators: +, -, * and /")
        raise SystemExit(1)

    print("{} {} {} = {}".format(a, operator, b, result))
EOF_100_MY_CALCULATOR_PY
cat > "$TARGET/101-easy_print.py" <<'EOF_101_EASY_PRINT_PY'
#!/usr/bin/python3
__import__("os").write(1, b"#pythoniscool\n")
EOF_101_EASY_PRINT_PY
cat > "$TARGET/102-magic_calculation.py" <<'EOF_102_MAGIC_CALCULATION_PY'
#!/usr/bin/python3
def magic_calculation(a, b):
    from magic_calculation_102 import add, sub

    if a < b:
        c = add(a, b)
        for i in range(4, 6):
            c = add(c, i)
        return c
    return sub(a, b)
EOF_102_MAGIC_CALCULATION_PY
cat > "$TARGET/103-fast_alphabet.py" <<'EOF_103_FAST_ALPHABET_PY'
#!/usr/bin/python3
import string
print(string.ascii_uppercase)
EOF_103_FAST_ALPHABET_PY
cat > "$TARGET/2-args.py" <<'EOF_2_ARGS_PY'
#!/usr/bin/python3
from sys import argv


if __name__ == "__main__":
    count = len(argv) - 1
    if count == 0:
        print("0 arguments.")
    elif count == 1:
        print("1 argument:")
    else:
        print("{} arguments:".format(count))

    for index in range(1, len(argv)):
        print("{}: {}".format(index, argv[index]))
EOF_2_ARGS_PY
cat > "$TARGET/3-infinite_add.py" <<'EOF_3_INFINITE_ADD_PY'
#!/usr/bin/python3
from sys import argv


if __name__ == "__main__":
    print(sum(map(int, argv[1:])))
EOF_3_INFINITE_ADD_PY
cat > "$TARGET/4-hidden_discovery.py" <<'EOF_4_HIDDEN_DISCOVERY_PY'
#!/usr/bin/python3


if __name__ == "__main__":
    import hidden_4

    for name in dir(hidden_4):
        if not name.startswith("__"):
            print(name)
EOF_4_HIDDEN_DISCOVERY_PY
cat > "$TARGET/5-variable_load.py" <<'EOF_5_VARIABLE_LOAD_PY'
#!/usr/bin/python3
from variable_load_5 import a


if __name__ == "__main__":
    print(a)
EOF_5_VARIABLE_LOAD_PY
cat > "$TARGET/README.md" <<'EOF_README_MD'
# Python - Import & Modules

This directory contains the completed **Python Import & Modules** project for the
`set-high_level_programming` repository.

## Learning objectives

The tasks practise importing functions and variables, protecting executable code
with `if __name__ == "__main__":`, processing command-line arguments, inspecting a
compiled module, reproducing bytecode behaviour, and meeting strict source-code
constraints.

## Required solution files

| File | Description |
|---|---|
| `0-add.py` | Imports `add` and prints `1 + 2 = 3`. |
| `1-calculation.py` | Imports calculator functions and prints four results. |
| `2-args.py` | Prints the number and list of command-line arguments. |
| `3-infinite_add.py` | Adds all integer command-line arguments. |
| `4-hidden_discovery.py` | Prints public names from `hidden_4.pyc`. |
| `5-variable_load.py` | Imports and prints the variable `a`. |
| `100-my_calculator.py` | Implements a command-line calculator. |
| `101-easy_print.py` | Prints `#pythoniscool` without using `print`. |
| `102-magic_calculation.py` | Recreates the supplied bytecode. |
| `103-fast_alphabet.py` | Prints the uppercase alphabet in three source lines. |

## Supplied helper modules

The project also includes `add_0.py`, `calculator_1.py`, `variable_load_5.py`, and
`magic_calculation_102.py` so the scripts can be run locally.

## Local test files

Portable test material is stored in `local-tests/`. Keeping it there prevents the
local `hidden_4.py` substitute from shadowing the official compiled module.

## Task 4: official compiled module

The official task requires `hidden_4.pyc`, compiled for **Python 3.8**. Download it
into this directory and run the script with Python 3.8:

```bash
curl -Lso hidden_4.pyc \
  "https://github.com/alx-tools/0x02.py/raw/master/hidden_4.pyc"
python3.8 ./4-hidden_discovery.py
```

## Run all local tests

```bash
chmod +x run_all_tests.sh
./run_all_tests.sh
```

## Commit the project

From the repository root:

```bash
git add python-import_modules
git commit -m "Complete Python import modules project"
git push
```
EOF_README_MD
cat > "$TARGET/add_0.py" <<'EOF_ADD_0_PY'
#!/usr/bin/python3
def add(a, b):
    """Return the sum of a and b."""
    return a + b
EOF_ADD_0_PY
cat > "$TARGET/calculator_1.py" <<'EOF_CALCULATOR_1_PY'
#!/usr/bin/python3
def add(a, b):
    """Return a + b."""
    return a + b


def sub(a, b):
    """Return a - b."""
    return a - b


def mul(a, b):
    """Return a * b."""
    return a * b


def div(a, b):
    """Return integer division compatible with the project example."""
    return int(a / b)
EOF_CALCULATOR_1_PY
cat > "$TARGET/local-tests/0-import_add.py" <<'EOF_LOCAL_TESTS_0_IMPORT_ADD_PY'
#!/usr/bin/python3
__import__("0-add")
EOF_LOCAL_TESTS_0_IMPORT_ADD_PY
cat > "$TARGET/local-tests/100-main.sh" <<'EOF_LOCAL_TESTS_100_MAIN_SH'
#!/usr/bin/env bash
../100-my_calculator.py
echo $?
../100-my_calculator.py 3 + 5
echo $?
../100-my_calculator.py 3 H 5
echo $?
EOF_LOCAL_TESTS_100_MAIN_SH
cat > "$TARGET/local-tests/102-main.py" <<'EOF_LOCAL_TESTS_102_MAIN_PY'
#!/usr/bin/python3
magic_calculation = __import__('102-magic_calculation').magic_calculation
print(magic_calculation(1, 2))
print(magic_calculation(8, 3))
EOF_LOCAL_TESTS_102_MAIN_PY
cat > "$TARGET/local-tests/2-main.sh" <<'EOF_LOCAL_TESTS_2_MAIN_SH'
#!/usr/bin/env bash
../2-args.py
../2-args.py Hello
../2-args.py Hello Welcome To The Best School
EOF_LOCAL_TESTS_2_MAIN_SH
cat > "$TARGET/local-tests/3-main.sh" <<'EOF_LOCAL_TESTS_3_MAIN_SH'
#!/usr/bin/env bash
../3-infinite_add.py
../3-infinite_add.py 79 10
../3-infinite_add.py 79 10 -40 -300 89
EOF_LOCAL_TESTS_3_MAIN_SH
cat > "$TARGET/local-tests/hidden_4.py" <<'EOF_LOCAL_TESTS_HIDDEN_4_PY'
#!/usr/bin/python3
__secret = "hidden"
my_secret_santa = 1
print_hidden = 2
print_school = 3
EOF_LOCAL_TESTS_HIDDEN_4_PY
cat > "$TARGET/magic_calculation_102.py" <<'EOF_MAGIC_CALCULATION_102_PY'
#!/usr/bin/python3
def add(a, b):
    """Return a + b."""
    return a + b


def sub(a, b):
    """Return a - b."""
    return a - b
EOF_MAGIC_CALCULATION_102_PY
cat > "$TARGET/run_all_tests.sh" <<'EOF_RUN_ALL_TESTS_SH'
#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")"

pass() { printf '[PASS] %s\n' "$1"; }
fail() { printf '[FAIL] %s\n' "$1" >&2; exit 1; }

for file in ./*.py local-tests/*.py; do
    python3 -m py_compile "$file"
done
pass "Python syntax"

[[ "$(./0-add.py)" == "1 + 2 = 3" ]] || fail "0-add.py"
[[ -z "$(python3 -c '__import__("0-add")')" ]] || fail "0-add.py import guard"
pass "0-add.py"

expected=$'10 + 5 = 15\n10 - 5 = 5\n10 * 5 = 50\n10 / 5 = 2'
[[ "$(./1-calculation.py)" == "$expected" ]] || fail "1-calculation.py"
[[ -z "$(python3 -c '__import__("1-calculation")')" ]] || fail "1-calculation.py import guard"
pass "1-calculation.py"

[[ "$(./2-args.py)" == "0 arguments." ]] || fail "2-args.py no arguments"
expected=$'1 argument:\n1: Hello'
[[ "$(./2-args.py Hello)" == "$expected" ]] || fail "2-args.py one argument"
expected=$'3 arguments:\n1: Hello\n2: Best\n3: School'
[[ "$(./2-args.py Hello Best School)" == "$expected" ]] || fail "2-args.py several arguments"
pass "2-args.py"

[[ "$(./3-infinite_add.py)" == "0" ]] || fail "3-infinite_add.py empty"
[[ "$(./3-infinite_add.py 79 10 -40 -300 89)" == "-162" ]] || fail "3-infinite_add.py values"
pass "3-infinite_add.py"

expected=$'my_secret_santa\nprint_hidden\nprint_school'
[[ "$(PYTHONPATH=local-tests ./4-hidden_discovery.py)" == "$expected" ]] || fail "4-hidden_discovery.py"
pass "4-hidden_discovery.py"

[[ "$(./5-variable_load.py)" == "98" ]] || fail "5-variable_load.py"
pass "5-variable_load.py"

set +e
usage_output="$(./100-my_calculator.py 2>&1)"; usage_status=$?
set -e
[[ $usage_status -eq 1 ]] || fail "100-my_calculator.py usage status"
[[ "$usage_output" == "Usage: ./100-my_calculator.py <a> <operator> <b>" ]] || fail "100-my_calculator.py usage output"
[[ "$(./100-my_calculator.py 3 + 5)" == "3 + 5 = 8" ]] || fail "calculator addition"
[[ "$(./100-my_calculator.py 9 - 2)" == "9 - 2 = 7" ]] || fail "calculator subtraction"
[[ "$(./100-my_calculator.py 3 '*' 5)" == "3 * 5 = 15" ]] || fail "calculator multiplication"
[[ "$(./100-my_calculator.py 10 / 4)" == "10 / 4 = 2" ]] || fail "calculator division"
set +e
operator_output="$(./100-my_calculator.py 3 H 5 2>&1)"; operator_status=$?
set -e
[[ $operator_status -eq 1 ]] || fail "calculator operator status"
[[ "$operator_output" == "Unknown operator. Available operators: +, -, * and /" ]] || fail "calculator operator output"
pass "100-my_calculator.py"

[[ "$(./101-easy_print.py)" == "#pythoniscool" ]] || fail "101-easy_print.py"
[[ "$(wc -l < 101-easy_print.py)" -le 2 ]] || fail "101-easy_print.py line count"
pass "101-easy_print.py"

[[ "$(PYTHONPATH=. python3 local-tests/102-main.py)" == $'12\n5' ]] || fail "102-magic_calculation.py"
pass "102-magic_calculation.py"

[[ "$(./103-fast_alphabet.py)" == "ABCDEFGHIJKLMNOPQRSTUVWXYZ" ]] || fail "103-fast_alphabet.py"
[[ "$(wc -l < 103-fast_alphabet.py)" -le 3 ]] || fail "103-fast_alphabet.py line count"
pass "103-fast_alphabet.py"

printf '\nAll local tests passed.\n'
EOF_RUN_ALL_TESTS_SH
cat > "$TARGET/variable_load_5.py" <<'EOF_VARIABLE_LOAD_5_PY'
#!/usr/bin/python3
a = 98
"""Simple variable."""
EOF_VARIABLE_LOAD_5_PY
chmod +x "$TARGET"/*.py "$TARGET"/run_all_tests.sh "$TARGET"/local-tests/*.py "$TARGET"/local-tests/*.sh
printf "Created %s\n" "$TARGET"