#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then    
    echo "Please run this script with root privilages"
    exit 1
fi

dnf list installed nginx

if [ $? -ne 0 ]
then    
    echo "nginx is not installed, now it is going to be installed"
    dnf install nginx -y
    if [ $? -ne 0 ]
    then
        echo "nginx is not installed, please check once again"
        exit 1      #exit 1 indicates that the script has terminated with an error
    else
        echo "nginx is successfully installed"
    fi
else    
    echo "nginx is already installed, nothing to do"
fi
