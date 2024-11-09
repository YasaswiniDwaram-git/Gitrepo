#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=10 #usually it is 75 for real projects
while IFS= read -r line #internal field seperator ,it will not ingnore white space , -r will not ignore spl characters like /@$#%
do
    echo $line
done <<< $DISK_USAGE
