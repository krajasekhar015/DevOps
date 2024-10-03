#!/bin/bash


# redirectors
# ---------------
# > -> by default, linux redirects only success output
# 1 for success & 2 for failure
# Ex: ls -l 2> logs.txt (redirects only error output to logs.txt)
# ls -l &> output.txt (Here'&' is used to redirect both success & failure to log.txt file)
# ls -l &>> output.txt (We, know double >> appends but won't replace)
# tee -a (writes logs to multile destinations, by default the log file gets overwritten so we use '-a' to append)


#-------------------------------------------------
#To save the logs files in particular folder
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date '+%Y-%m-%d-%H-%M-%S')
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER 

#The -p option stands for "parent" and it runs without getting an error if the parent directories already exist.

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script using root privileages $N" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo -e "$R $2 is FAILED $N"  | tee -a $LOG_FILE   
        exit 1
    else
        echo -e "$G $2 is SUCCESS $N" | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo "USAGE: sh 11.redirectors.sh package1 package2..."
    exit 1
}

echo "Script started executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

for PACKAGE in $@  # $@ refers to all arguments passed to it
do
    dnf list installed $PACKAGE &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$Y $PACKAGE is not been installed...going to install $N" | tee -a $LOG_FILE
        dnf install $PACKAGE -y &>>$LOG_FILE
        VALIDATE $? "INSTALLING $PACKAGE"  
    else
        echo -e "$Y The package $PACKAGE has been already installed $N" | tee -a $LOG_FILE
    fi
done


