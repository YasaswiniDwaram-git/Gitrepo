#!/bin/bash

READ_FILE=$sometext.txt
WORD_COUNT=$(cat $READ_FILE |wc)

while IFS= read -r line #internal field seperator ,it will not ingnore white space , -r will not ignore spl characters like /@$#%
do
    echo "total words in line :$WORD_COUNT "
    FORMAT=$(awk '{print $5F}' $READ_FILE )
done <<< $READ_FILE

