#!/bin/bash

number=$1
st=0
sec=1

for (( i=0 ; i<$number ; i++)) 
do
    echo "$st"
    new=$(($st+$sec))
    st=$sec
    sec=$new
done


# new_num=$1
# function fibonacci () {
#     if [ $new_num -le 0 ] 
#     then
#         echo 0
#     elif [ $new_num -eq 1 ]
#     then
#         echo 1
#     else
#         echo $[`fibonacci $[$new_num-1]` + `fibonacci $[$new_num-2]`]
#     fi
# }

# # fibonacci $new_num
# # for (( $new_num ; $new_num>=0 ; $new_num--))
# # do
# #     fibonacci $new_num
# # done