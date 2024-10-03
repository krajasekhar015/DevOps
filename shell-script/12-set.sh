#!/bin/bash

# Colour Codes for text customization
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

set -e # setting the automatic exit, if we get error, set -x for debug, 'set -o pipefail' ensures that the script fails if any command in a pipeline fails, even if other commands in the pipeline succeed

failure(){
    echo -e "$R Failed at: $1:$2 $N"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR # ERR is the error signal

echo "Hello World success"
echooooo "Hello Wolrd failure"
echo "Hello World after failure"