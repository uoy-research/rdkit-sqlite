RDKIT=rdkit

SHELL=/bin/sh
CC=gcc
SRC=src/main.c src/utils.c
CFLAGS=-g -fPIC -shared
LDFLAGS=-I $(RDKIT)/Code -I $(RDKIT)/Code/MinimalLib -lrdkitcffi -Llib
OUTPUT=librdkitsqlite

all: $(OUTPUT)
.PHONY: all clean

librdkitsqlite: $(SRC)
	mkdir -p build
	$(CC) $(CFLAGS) $(SRC) -o build/$(OUTPUT).so $(LDFLAGS)

test:
	LD_LIBRARY_PATH=$(PWD)/lib:$(LD_LIBRARY_PATH) util/test.sh tests/

clean:
	rm build/$(OUTPUT).so
