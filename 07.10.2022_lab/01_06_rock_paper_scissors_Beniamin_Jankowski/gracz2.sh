while true
do
    if [ -f "komenda.txt" ]
    then
        file=$(cat komenda.txt 2>>/dev/null)
        for line in $file
        do
            if [[ $line == "start" ]]
            then
                result_1=$(($RANDOM % 3))
                if [[ $result_1 -eq 0 ]]
                then
                    echo "rock" > los2.txt
                elif [[ $result_1 -eq 1 ]]
                then
                    echo "paper" > los2.txt
                else
                    echo "rock" > los2.txt
                fi

            elif [[ $line == "stop" ]]
            then
                exit 0
            fi
        done
        
    fi
done
