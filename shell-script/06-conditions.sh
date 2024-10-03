#!/bin/bash

# Numeric Comparisons:
# ----------------------
# -eq: Equal to
# -ne: Not equal to
# -gt: Greater than
# -ge: Greater than or equal to
# -lt: Less than
# -le: Less than or equal to

# String Comparisons:
# -------------------------
# =: Equal to
# !=: Not equal to
# <: Less than (lexicographically)
# >: Greater than (lexicographically)

# File Tests:
# -----------------
# -e: File exists
# -f: File exists and is a regular file
# -d: File exists and is a directory
# -r: File is readable
# -w: File is writable
# -x: File is executable

# Logical Operators:
# -----------------------
# &&: Logical AND, ||: Logical OR, and !: Logical NOT.


NUMBER=$1

if [ $NUMBER -gt 20 ] 
then
    echo "Given number: $NUMBER is greater than 20"
else
    echo "Given number: $NUMBER is less than 20"
fi