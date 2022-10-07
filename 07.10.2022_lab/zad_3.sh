base=$1;
power=$2;
echo "Solved using operator:";
echo $(( base ** power));

res=$base;
for (( i=1; i < $power; i++));
do
    res=$(($res*$base));
done
echo "Solved using for-loop:";
echo $res;