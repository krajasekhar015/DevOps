#!/bin/bash
for arg in "$@"
do
echo "Argument: $arg"
done


echo "Number of arguments passed: $#"
echo "The script name is: $0"
echo "All arguments as a single string: $*"
echo "Exit status of the last command: $?"
echo "Present Working Directory: $PWD"
echo "The process ID of this script is: $$"
sleep 30 &
echo "PID of the last background command: $!"