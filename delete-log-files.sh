#!/bin/bash

SOURCE_DIRECTORY=/home/ec2-user/logs

if [ -d $SOURCE_DIRECTORY]
then
    echo "$SOURCE_DIRECTORY exists"
else
    echo "$SOURCE_DIRECTORY does not exist"
fi

