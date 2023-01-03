#!/bin/bash
arguments=($*)

for ((i=$#-1; i >= 0; i--))
do
    echo -n "${arguments[$i]} "
done
echo    