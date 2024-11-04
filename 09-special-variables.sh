#!/bin/bash

echo "all variables to be sent to $@"
echo "how many variables passed in the script - $#"
echo "script name is : $0"
echo "current working directory :$PWD"
echo "Home directory of current : $HOME"
echo "5. To know process id of current command $$"
echo "6. to know PID of last BG command $!"
sleep 100 &
echo "$!"