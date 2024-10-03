#!/bin/bash

# =====================================================

#VARIABLES INSIDE THE SCRIPT

#PERSON1 & PERSON2 are the variable names which holdes the input entered by the user

# PERSON1=RAJU
# PERSON2=RAMESH
# echo "${PERSON1}: Hi $PERSON2, how are you"
# echo "$PERSON2: Im good, What about you $PERSON1"

# ====================================================

#VARIABLES PASSING AS ARGUMENTS THROUGH THE COMMAND PROMPT

#Here $1 & $2 are the inputs entered by the users from command prompt
#The primary use of $ is to access the value of a variable
#PERSON1 & PERSON2 are the variable names which holdes the input entered by the user

# PERSON1=$1 
# PERSON2=$2

# echo "$PERSON1: Hi $PERSON2, how are you"
# echo "$PERSON2: Im good, What about you $PERSON1"

# =======================================================

#VARIABLES PASSING THROUGH INTERUPTION

#Here 'read' is the command used to capture user input & stores it in a variable (USERNAME & PASSWORD)
#Here '-s' is used to hide the information of username & password from the terminal

echo "Please enter your Username:"
read -s USERNAME
echo "Please enter your Password:"
read -s PASSWORD
echo "USERNAME: $USERNAME"
echo "PASSWORD: $PASSWORD"
