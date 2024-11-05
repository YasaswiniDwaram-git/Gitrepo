#!/bin/bash

USERID=$(id -u)

CHECK_ROOT(){
if [ $USERID -ne 0 ]
then
    echo "please run script with root access"
    exit 1
else 
    echo "welcome admin , anything for you today? "
fi
}

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "Git installation is failed , please check" #this has to be run in sudo to check
        exit 1
    else 
        echo "Git installation is success"
    fi
}

#here 
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




