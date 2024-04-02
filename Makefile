RDBASE=rdkit/rdkit

SHELL=/bin/sh
CC=gcc
OBJ="src/main.c"
CFLAGS=-g -fPIC -shared -I lib -I $(RDBASE)/Code -lrdkitcffi -Llib

all: librdkitsqlite
.PHONY: all

librdkitsqlite: src/main.c
	$(CC) $(OBJ) -o build/librdkitsqlite.so $(CFLAGS)

clean:
	rm build/librdkitsqlite.so
