#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m]"

CHECK_ROOT(){
if [ $USERID -ne 0 ]
then
    echo "please run script with root access"
    exit 1
else 
    echo "welcome admin , anything for you today? "
fi
}

CHECK_ROOT

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is....$R FAILED $N"
        exit 1
    else 
        echo -e "$2 is....$G success $N"
    fi
}

for PACKAGE in $@
do
    dnf list installed $PACKAGE
    if [$? -eq 0 ]
    then
        echo "$PACKAGE is already installed , nothing to do"
    else
        echo "$PACKAGE is not installed , going to install it now "
        dnf install $PACKAGE -y
        VALIDATE $? "Installing $PACKAGE"
    fi

done




