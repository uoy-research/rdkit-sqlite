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

run: build/$(OUTPUT).so
	export LD_LIBRARY_PATH=$(PWD)/lib:$(LD_LIBRARY_PATH)
	sqlite3 data.db < util/queries.sql

clean:
	rm build/$(OUTPUT).so
