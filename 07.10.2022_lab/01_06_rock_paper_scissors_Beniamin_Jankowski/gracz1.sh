while true
do
    if [ -f "komenda.txt" ]
    then
    
        if [[ line == "start" ]]
        then
            if [ ! -f "los1.txt" ]
            then
                result_1=$(($RANDOM % 3))
                if [[ $result_1 -eq 0 ]]
                then
                    echo "rock" > los1.txt
                elif [[ $result_1 -eq 1 ]]
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
        
    fi
done

