directory="/home/Benek/Desktop/Operating_systems_repo/07.10.2022_lab/01_06_rock_paper_scrissors_Beniamin_Jankowski"
while true
do
    if [ -f "$directory/komenda.txt" ]
    then
        for line in $file:
        do
            if [ line=="start" ]
            then
                if [ -f "$directory/los1.txt" ]
                then
                    continue
                else
                    result_1=$(( 1 + $RANDOM % 2 ))
                    echo $result_1 > los1.txt
                fi
            fi

            if [ line=="stop"]
            then
                exit 0
            fi
        done
    else 
        echo "komenda.txt doesn't exist"
        exit 1
    fi
done

