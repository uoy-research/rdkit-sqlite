#!/bin/sh

export RDBASE=$HOME/Code/rdkit/rdkit LD_LIBRARY_PATH=$RDBASE/lib:$LD_LIBRARY_PATH

gcc -g -fPIC -shared src/main.c src/utils.c -o build/librdkit.so -I lib -I $RDBASE/Code -lrdkitcffi -Llib
