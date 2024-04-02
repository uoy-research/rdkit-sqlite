RDBASE=rdkit/rdkit

SHELL=/bin/sh
CC=gcc
OBJ="src/main.c"

all: librdkitsqlite
.PHONY: all

librdkitsqlite: src/main.c
	$(CC) $(OBJ) -o build/librdkitsqlite.so -g -fPIC -shared -I lib -I $(RDBASE)/Code -lrdkitcffi -Llib

clean:
	rm build/librdkitsqlite.so
