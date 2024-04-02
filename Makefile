RDBASE=rdkit/rdkit

SHELL=/bin/sh
CC=gcc
OBJ=src/main.c
CFLAGS=-g -fPIC -shared -I lib -I $(RDBASE)/Code -lrdkitcffi -Llib
OUTPUT=librdkitsqlite

all: librdkitsqlite
.PHONY: all

librdkitsqlite: $(OBJ)
	$(CC) $(OBJ) -o build/$(OUTPUT).so $(CFLAGS)

clean:
	rm build/$(OUTPUT).so
