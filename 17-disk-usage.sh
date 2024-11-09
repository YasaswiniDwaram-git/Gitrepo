#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=10 #usually it is 75 for real projects
while IFS= read -r line #internal field seperator ,it will not ingnore white space , -r will not ignore spl characters like /@$#%
do
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | grep xfs | aws -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$PARTITION is more than $DISK_THRESHOLD , current consumption is $USAGE , please check "
    fi
done <<< $DISK_USAGE
