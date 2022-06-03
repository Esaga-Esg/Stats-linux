#! /bin/bash
printf "Hora\t\tMemory\t\tDisk\t\tCPU\t\tRx\t\tTx\n"
end=$((SECONDS+65))
while [ $SECONDS -lt $end ]; do
TIEMPO=$(date  | awk '{printf "%s\t", $(NF-2)}')
MEMORIA=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISCO=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t", $(NF-2)}')
RED=$(ifstat 1 1 | tail -1 | awk '{print $1"\t\t"$2"\t\t\n"}')
echo "$TIEMPO$MEMORIA$DISCO$CPU$RED"
done
