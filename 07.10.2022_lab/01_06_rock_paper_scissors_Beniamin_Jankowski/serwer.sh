#!/bin/bash
number_of_games=$1
touch gra.log

while [[ $number_of_games -gt 0 ]]
do
    echo "start" > komenda.txt
    while true
    do
        if [ -f los1.txt ] && [ -f los2.txt ]
        then
            break
        fi
    done

    sleep 0.1s
    rm komenda.txt
    res_1=$(cat los1.txt)
    res_2=$(cat los2.txt)

    win_1="1. Player won"
    win_2="2. Player won"

    count_win_1=0
    count_win_2=0

    if [[ $res_1 == $res_2 ]]
    then
        echo "It's a draw!" >> gra.log

    elif [[ $res_1 == "rock" ]]
    then
        if [[ $res_2 == "paper" ]]
        then 
            echo $win_2 >> gra.log
            count_win_2=$(($count_win_2+1))
        else
            echo $win_1 >> gra.log
            count_win_1=$(($count_win_1+1))
        fi

    elif [[ $res_1 == "scissors" ]]
    then
        if [[ $res_2 == "paper" ]]
        then 
            echo $win_1 >> gra.log
            count_win_1=$(($count_win_1+1))
        else
            echo $win_2 >> gra.log
            count_win_2=$(($count_win_2+1))
        fi

    else #res_1 == "paper"
        if [[ $res_2 == "scissors" ]]
        then 
            echo $win_2 >> gra.log
            count_win_2=$(($count_win_2+1))
        else
            echo $win_1 >> gra.log
            count_win_1=$(($count_win_1+1))
        fi
    fi
    echo $number_of_games 
    $number_of_games=$(($number_of_games-1))
done

echo "First player  :  Second player"
echo "$count_win_1  :  $count_win_2"

echo "stop" > komenda.txt
sleep 1s
exit 0