#!/bin/sh

export RDBASE=$HOME/Code/rdkit/rdkit PYTHONPATH=$RDBASE LD_LIBRARY_PATH=$RDBASE/lib:$LD_LIBRARY_PATH

#cc -I $RDBASE/Code demo.c -L"$PWD/lib" -lrdkitcffi 
#cc -o demo.o -I lib -I $RDBASE/Code src/main.c lib/librdkitcffi.so -Llib
cc -o build/demo -I lib -I $RDBASE/Code src/main.c -lrdkitcffi -Llib
