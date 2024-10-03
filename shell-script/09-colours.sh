#!/bin/bash

USERID=$(id -u)

# Colour Codes for text customization
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECKROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "PLEASE RUN THIS SCRIPT WITH ROOT PRIVILEAGES"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2 HAS BEEN FAILED. PLEASE CHECK ONCE $N"   #Here '-e' should be mandatory to enable colours
        exit 1
    else
        echo -e "$G $2 HAS BEEN SUCESSFULL $N"
    fi
}

CHECKROOT

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e "$Y MySQL is not installed in your machine. Now its going to install $N"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo -e "$Y MySQL is already installed in your machine. Nothing to-do $N"
fi