#!/bin/bash
if [ ! -f Downloads/*.$1 ]
then
    echo "File(s) not found."
    transfer_flag=1
else
    if [ -d $2 ]
    then
        echo "Directory $2 exists. Moving file now."
        transfer_flag=0 
    else
        echo "Error: Directory $2 does not exist. Do you want to create it now? [y/n]"
        read choice
        if [ $choice = "y" ] || [ $choice = "Y" ]
        then
            mkdir $2
            transfer_flag=0
        elif [ $choice = "n" ] || [ $choice = "N" ]
        then
            echo "Cancelling operation."
            transfer_flag=1
        else
            echo "Cannot understand command."
            transfer_flag=1
        fi
    fi
fi
if [ $transfer_flag = 0 ]
then
    mv Downloads/*.$1 $2
    echo "File(s) moved successfully."
else
    echo "File(s) not moved."
fi