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