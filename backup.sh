#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

SOURCE_DIRECTORY=$1
DESTINATION_DIRECTORY=$2
NUMBER_OF_DAYS=${3:-14} # if given  , the consider $3 , else will take 14 days

USAGE(){
    echo -e "$R input format should be : $N <source_directory> <destination_directory> <days(optional)>"
}

#check if source and destination are there are not
# we need atleast 2 arg to proceed , so
if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIRECTORY ]
then
    echo -e " $R $SOURCE_DIRECTORY is not present $N , please check"
fi

if [ ! -d $DESTINATION_DIRECTORY ]
then
    echo -e " $R $DESTINATION_DIRECTORY is not present $N, please check"
fi

LOG_FILES=$(find ${SOURCE_DIRECTORY} -name "*.log" -mtime +14) #to list 14 days logs

#check files if exist or not in the directory , if zero , nothing to do else zip them
echo "Files present are : $LOG_FILES"

if [ ! -z  "$LOG_FILES" ] # -z if true if file is empty but ! makes it as files is not empty
then
    echo "Files are found"
else
    echo " No files older than $NUMBER_OF_DAYS"
fi


