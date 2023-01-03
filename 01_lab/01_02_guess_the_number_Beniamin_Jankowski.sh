#!/bin/bash
min=$1
max=$2

if [ $max -le $min ]
then
    echo "The first number should be lower than max"
    exit 1
fi
max_attempts=$((($max-$min)/2+1))
random=$(( $min + $RANDOM % $(($max-$min)) ))

while true
do
    echo "You've got $max_attempts attempts left!"
    read number
    if [ $number -lt $random ]
    then
        echo "The number is greater..."
    elif [ $number -gt $random ]
    then
        echo "The number is smaller..."
    else
        echo "You're right!"
        break
    fi

    max_attempts=$(($max_attempts-1))

    if [ $max_attempts -eq 0 ]
    then
        echo "You ran out of attempts!"
        break
    fi
done

