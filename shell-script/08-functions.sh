#!/bin/bash

USERID=$(id -u)

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
        echo "$2 HAS BEEN FAILED. PLEASE CHECK ONCE"
        exit 1
    else
        echo "$2 HAS BEEN SUCESSFULL"
    fi
}

CHECKROOT

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed in your machine. Now its going to install"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already installed in your machine. Nothing to-do"
fi