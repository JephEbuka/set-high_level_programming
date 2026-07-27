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
