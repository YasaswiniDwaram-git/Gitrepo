#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "please run script with root access"
    exit 1
fi

yum list installed git

if [ $? -ne 0 ]
then
    echo "it is not there , will install"
    yum install git -y
else 
    echo " it's there dude , check and ask"
fi