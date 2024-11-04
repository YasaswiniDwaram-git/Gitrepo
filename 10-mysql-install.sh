#!/bin/bash

USERID=$(id -u)
if [$USERID -ne 0]
then
    echo "please run script with root access"
fi

dnf install git -y