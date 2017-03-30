#!/bin/bash
cd /home/developer/testArea
source_array=()
final_array=()
index=0
pattern1="^.*[^.tmp]$"
pattern2="^.*[.tmp]$"
for i in `ls`
do
    source_array[$index]=$i
    #echo "i = $i"
    index=`expr $index + 1`
    #echo "index = $index"
done
index=0

for i in ${source_array[*]}
do
    if [[ $i =~ $pattern2 ]]
    then
        tmp_array[$index]=${i%.tmp}
        index=`expr $index + 1`
    fi
done
index=0
true=0
#echo ${tmp_array[*]}

for i in ${source_array[*]}
do
    for n in ${tmp_array[*]}
    do
	tmpn=$n".tmp"
        #echo $tmpn
        if [ $i == $n ]
        then
#             echo "1111111111"
	     true=1
        fi 
        if [ $i == $tmpn ]
        then
 #           echo "2222222222"
            true=1
        fi
    done
#echo $true
if [ $true -eq 0 ]
then 
    echo $i
fi
if [ $true -eq 1 ]
then
    true=0
fi
done
