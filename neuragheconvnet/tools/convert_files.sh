#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ] 
then
    echo "Not enough parameters!" 

    echo "usage: ./covert_data <out type> <QF> <input bin file path> <output bin file path>"
    echo ""
    echo "    - out type:"
    echo "        float : floating point"
    echo "        fixed : fixed point"
    echo "    - QF: number of bits for the fractional part"
else
	mkdir $4 

	for file in $3/*
	do

		fullfilename="$file"
		filename=$(basename "$fullfilename")
		fname="${filename%.*}"
		extension="${filename##*.}"

		#echo ./convert_data_files -$1 "$file" $3/"$filename"
		
		if [ "$extension" == "bin" ]
		then
			./convert_data_file -$1 $2 "$file" $4/"$filename"
		else
			echo "Skip $file"
			cp "$file" $4
		fi
	done
fi
