#!/bin/bash

READ_FILE=/home/ec2-user/sometext.txt


while IFS= read -r line #internal field seperator ,it will not ingnore white space , -r will not ignore spl characters like /@$#%
do 
    WORD_COUNT=$(echo $line |wc -w)
    echo "Total words in line is : $WORD_COUNT"
    echo "First 5 word are :$line" | cut -d " " -f1-5
done <<< $READ_FILE

