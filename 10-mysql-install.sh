#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "please run script with root access"
    exit 1
fi

dnf list installed git

if [ $? -e 0 ]
then
    echo "it is not there , will install"
    dnf install git -y
else 
    echo " it's there dude , check adn ask"
fi