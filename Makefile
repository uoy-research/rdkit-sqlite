RDBASE=rdkit/rdkit

SHELL=/bin/sh
CC=gcc
OBJ=src/main.c
CFLAGS=-g -fPIC -shared -I lib -I $(RDBASE)/Code -lrdkitcffi -Llib
OUTPUT=librdkitsqlite

all: $(OUTPUT) db
.PHONY: all

librdkitsqlite: $(OBJ)
	$(CC) $(OBJ) -o build/$(OUTPUT).so $(CFLAGS)

db:
	sqlite3 data.db < util/init.sql

run: build/$(OUTPUT).so
	export LD_LIBRARY_PATH=$(PWD)/lib:$(LD_LIBRARY_PATH)
	sqlite3 data.db < util/queries.sql

test:
	export LD_LIBRARY_PATH=$(PWD)/lib:$(LD_LIBRARY_PATH)
	sqlite3 data.db < util/queries.sql > .output.txt
	diff .output.txt util/correct.txt && echo "\nPASSED" || echo "\nFAILED"

clean:
	rm build/$(OUTPUT).so
