RDKIT=rdkit
DB=data.db

SHELL=/bin/sh
CC=gcc
OBJ=src/main.c src/utils.c
CFLAGS=-g -fPIC -shared -I $(RDKIT)/Code -I $(RDKIT)/Code/MinimalLib -lrdkitcffi -Llib
OUTPUT=librdkitsqlite

librdkitsqlite: $(OBJ)
	$(CC) $(OBJ) -o build/$(OUTPUT).so $(CFLAGS)

all: $(OUTPUT) db
.PHONY: all

db:
	rm $(DB)
	sqlite3 $(DB) < util/init.sql

run: build/$(OUTPUT).so
	LD_LIBRARY_PATH=$(PWD)/lib:$(LD_LIBRARY_PATH) sqlite3 $(DB) < util/queries.sql

test: db
	LD_LIBRARY_PATH=$(PWD)/lib:$(LD_LIBRARY_PATH) sqlite3 $(DB) < util/queries.sql > .output.txt
	diff .output.txt util/correct.txt && echo "\nPASSED" || echo "\nFAILED"

clean:
	rm $(DB)
	rm build/$(OUTPUT).so
