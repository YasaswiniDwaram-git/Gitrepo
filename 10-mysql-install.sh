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
    if [ $? -ne 0 ]
    then
        echo "Git installation is failed , please check" #this has to be run in sudo to check
        exit 1
    else 
        echo "Git installation is success"
    fi
else 
    echo " it's there dude , check and ask"
fi

yum list installed mysql

if [ $? -ne 0 ]
then
    echo "it is not there , will install"
    yum install mysql -y
    if [ $? -ne 0 ]
    then
        echo "MySQL installation is failed , please check" #this has to be run in sudo to check
        exit 1
    else 
        echo "MySQL installation is success"
    fi
else 
    echo " it's there dude , check and ask"
fi