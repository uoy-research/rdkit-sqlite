FROM debian:stable-slim
RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev sqlite3 git cmake libboost-all-dev catch2 libfreetype-dev

ENV ROOT=/opt/rdkitsqlite
WORKDIR $ROOT
COPY . $ROOT

ENV RDKIT_ROOT=$ROOT/rdkit
RUN git clone https://github.com/rdkit/rdkit.git $RDKIT_ROOT
RUN mkdir -p $RDKIT_ROOT/build
WORKDIR $RDKIT_ROOT/build
RUN cmake -DRDK_BUILD_CFFI_LIB=ON -DRDK_BUILD_INCHI_SUPPORT=ON -DRDK_BUILD_PYTHON_WRAPPERS=OFF ..
RUN make -j 2 cffi_test
RUN Code/MinimalLib/cffi_test
RUN mkdir -p $ROOT/lib && cp lib/* $ROOT/lib

WORKDIR $ROOT
RUN make
RUN cp $ROOT/lib/* /lib
RUN cp $ROOT/build/* /lib
ENV LD_LIBRARY_PATH=$ROOT/lib

CMD ["sqlite3", ":memory:", "-cmd", ".load /lib/librdkitsqlite"]
