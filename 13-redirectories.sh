#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m]"

LOGS_FOLDER="/var/log/shell-scriptings"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME/$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER

CHECK_ROOT(){
if [ $USERID -ne 0 ]
then
    echo "$R please run script with root access $N" &>>$LOG_FILE
    exit 1
else 
    echo "welcome admin , anything for you today? "
fi
}

CHECK_ROOT

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is....$R FAILED $N" &>>$LOG_FILE
        exit 1
    else 
        echo -e "$2 is....$G success $N" &>>$LOG_FILE
    fi
}

for PACKAGE in $@
do
    dnf list installed $PACKAGE
    if [$? -eq 0 ]
    then
        echo "$PACKAGE is already installed , nothing to do" &>>$LOG_FILE
    else
        echo "$PACKAGE is not installed , going to install it now " &>>$LOG_FILE
        dnf install $PACKAGE -y
        VALIDATE $? "Installing $PACKAGE" &>>$LOG_FILE
    fi

done