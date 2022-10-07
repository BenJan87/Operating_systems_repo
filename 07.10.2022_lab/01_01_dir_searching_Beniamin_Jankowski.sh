directory=$1
size=$2

ls $1 -ltR | grep -E "^-.*" | awk '{if ($5 > $size) print $9}' | head -1