#!/bin/bash
# this programm only finding possible solutions for 
degree=$1
factors=($*)
unset factors[0]


#the res should be 2x^2 + 3x + 4, so => 8 + 6 + 10 = 18

# for ((i=1; i < $#; i++))
# do
#     echo ${factors[$i]}
# done

function value_of_pol() {
    res=0
    for ((i=$degree+1; i > 0; i--))
    do
        res=$(($res+$((${factors[$i]}*($1)**($degree-$i+1)))))
    done
    return $res
}

function finding_range() {
    a=1000
    b=-1000

    value_of_pol $a
    temp_a=$?
    value_of_pol $b
    temp_b=$?

    range=(
    [0]=$a
    [1]=$b
   )
    while true
    do
        if [ $(($temp_a*$temp_b)) -lt 0]
        then
            range[0]=$temp_a<$temp_b?$temp_a:$temp_b
            range[1]=$temp_a>$temp_b?$temp_a:$temp_b
        else
            
}