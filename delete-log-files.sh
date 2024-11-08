#!/bin/bash

SOURCE_DIRECTORY=/home/ec2-user/logs

if [ -d $SOURCE_DIRECTORY ]
then
    echo "$SOURCE_DIRECTORY exists"
else
    echo "$SOURCE_DIRECTORY does not exist"
fi

LOG_FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)
echo "Files are : $LOG_FILES"

while IFS= read -r line #internal field seperator ,it will not ingnore white space , -r will not ignore spl characters like /@$#%
do
    echo "Deleting line :$line" 
    rm -rf $line
done <<< $LOG_FILES  #taking input fron $LOG_FILES