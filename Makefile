RDKIT=rdkit
DB=data.db

SHELL=/bin/sh
CC=gcc
OBJ=src/main.c
CFLAGS=-g -fPIC -shared -I lib -I $(RDKIT)/Code -lrdkitcffi -Llib
OUTPUT=librdkitsqlite

librdkitsqlite: $(OBJ) rdkit
	$(CC) $(OBJ) -o build/$(OUTPUT).so $(CFLAGS)

all: $(OUTPUT) db
.PHONY: all

rdkit:
	git clone https://github.com/rdkit/rdkit.git $(RDKIT)
	mkdir $(RDKIT)/build && cd $(RDKIT)/build && cmake ..

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
