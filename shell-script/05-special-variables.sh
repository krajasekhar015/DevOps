#!/bin/bash

#The following are the special variables used in the shell script for particular purpose

# $@ : All of the positional parameters.
# $# : The number of positional arguments passed to the script.
# $0 : The name of the current script.
# $$ : The process ID (PID) of the current shell.
# $! : The process ID (PID) of the last background command.
# $* : All of the positional parameters as a single string.
# $1, $2, etc.: The first, second, etc., positional arguments passed to the script.
# $pwd : Shows the current working directory
# $home : Show the home directory of the current user
# $? : The exit status of the most recently executed command.


VALUE1=$1
VALUE2=$2

sleep 100 &

echo "Arguments passed to the script: $@"
echo "Number of arguments passed: $#"
echo "Script name: $0"
echo "PID of the script executing now: $$"
echo "PID of last background command: $!"
echo "All variables passed to the script: $*"
echo "All variables passed to the script: $1 & $2"
echo "Current working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "The exist status of last excuted command: $?"

