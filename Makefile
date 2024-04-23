RDKIT=rdkit

SHELL=/bin/sh
CC=gcc
OBJ=src/main.c src/utils.c
CFLAGS=-g -fPIC -shared -I $(RDKIT)/Code -I $(RDKIT)/Code/MinimalLib -lrdkitcffi -Llib
OUTPUT=librdkitsqlite

librdkitsqlite: $(OBJ) rdkit
	$(CC) $(OBJ) -o build/$(OUTPUT).so $(CFLAGS)

all: $(OUTPUT)
.PHONY: all

rdkit:
	git clone https://github.com/rdkit/rdkit.git $(RDKIT)
	mkdir -p $(RDKIT)/build && \
	cd $(RDKIT)/build && \
	cmake -DRDK_BUILD_CFFI_LIB=ON -DRDK_BUILD_INCHI_SUPPORT=ON -DRDK_BUILD_PYTHON_WRAPPERS=OFF .. && \
	make -j 2 cffi_test && \
	Code/MinimalLib/cffi_test
	mkdir -p lib && cp $(RDKIT)/build/lib/* lib/

test:
	LD_LIBRARY_PATH=$(PWD)/lib:$(LD_LIBRARY_PATH) util/test.sh tests/

clean:
	rm build/$(OUTPUT).so
