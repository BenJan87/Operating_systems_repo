while true
do
    if [ -f "komenda.txt" ]
    then
        for line in $file:
        do
            if [[ line == "start" ]]
            then
                if [ ! -f "los2.txt" ]
                then
                    result_2=$(($RANDOM % 3))
                    if [[ $result_2 -eq 0 ]]
                    then
                        echo "rock" > los1.txt
                    elif [[ $result_2 -eq 1 ]]
                    then
                        echo "paper" > los1.txt
                    else
                        echo "rock" > los1.txt
                    fi
                fi
            fi

            if [[ line == "stop" ]]
            then
                exit 0
            fi
        done
    fi
done