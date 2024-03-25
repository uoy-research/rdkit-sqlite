RDBASE=$(HOME)/Code/rdkit/rdkit

CC=gcc

librdkitsqlite: src/main.c
	$(CC) src/main.c -o build/librdkitsqlite.so -g -fPIC -shared -I lib -I $(RDBASE)/Code -lrdkitcffi -Llib

clean:
	rm build/librdkitsqlite.so