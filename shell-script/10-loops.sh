#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script using root privileages $N"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo -e "$R $2 is FAILED $N"
        exit 1
    else
        echo -e "$G $2 is SUCCESS $N"
    fi
}

CHECK_ROOT

# sh 15-loops.sh git mysql postfix nginx
for PACKAGE in $@  # $@ refers to all arguments passed to it
do
    dnf list installed $PACKAGE
    if [ $? -ne 0 ]
    then
        echo -e "$Y $PACKAGE is not been installed...going to install $N"
        dnf install $PACKAGE -y
        VALIDATE $? "INSTALLING $PACKAGE"  
    else
        echo -e "$Y The package $PACKAGE has been already installed $N"
    fi
done


