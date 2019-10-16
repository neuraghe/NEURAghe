#!/bin/bash

TEMPLATE=tests/template

if [ "$#" -lt 1 ]; then
  printf "Usage: create_NEURAghe_project <project_name> [onnx_path]\n";
  return
fi

if [ ! -f "$TEMPLATE/src/template.cpp" ]; then
    echo "$TEMPLATE/src/template.cpp does not exist"
    return
fi
if [ ! -f "$TEMPLATE/src/template.h" ]; then
    echo "$TEMPLATE/src/template.h does not exist"
    return
fi

printf "\n\n#########################################################\n"
printf "WARNING: currently this script supports only NEURAghe v1\n"
printf "#########################################################\n\n"

printf "Creating folder tests/$1/src ..."
mkdir -p ./tests/$1/src
printf "\e[32m done\e[39m\n"

printf "Creating $1.cpp ..."
sed "s/{template}/$1/g" $TEMPLATE/src/template.cpp > ./tests/$1/src/$1.cpp
printf "\e[32m done\e[39m\n"

printf "Creating $1.h ..."
sed "s/{template}/$1/g" $TEMPLATE/src/template.h > ./tests/$1/src/$1.h
printf "\e[32m done\e[39m\n"


printf "Creating folder tests/$1/Imgs ..."
mkdir -p ./tests/$1/Imgs
printf "\e[32m done\e[39m\n"


printf "Creating folder tests/$1/weights ..."
mkdir -p ./tests/$1/weights
printf "\e[32m done\e[39m\n"

if [ "$#" -eq 2 ]; then
    printf "Extracting weights ..."

    python3 extract_weights.py $2 -P ./temp_weights

    cd temp_weights/
    #copying the GEMM and FC weights. They are not processed
    find . ! -name "*Conv*.bin" -a -name "*.bin" -exec bash -c "cp '{}' ../tests/$1/weights/" \;
    cd ..
    printf "\e[32m done\e[39m\n"

    printf "Weights processing (post-training) ..."

    cd ./temp_weights
    post_training.py ../post_training_settings.txt
    cp -r ./pt/* ../tests/$1/weights
    cd ..
    rm -r ./temp_weights

    printf "\e[32m done\e[39m\n"
fi


printf "\n\e[32mProject successfully created!\e[39m\n\n"

printf "You may compile the new project with the command: \n"
printf "$ \e[96mmake clean all NEURAGHE=1 FIXED=1 TEST=tests/$1\e[39m\n\n"

printf "Please, refer to the documentation for other arguments.\n"

