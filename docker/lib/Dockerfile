FROM debian:bookworm-slim
RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev sqlite3 git cmake catch2 wget

ARG BOOST_MAJOR_VERSION="1"
ARG BOOST_MINOR_VERSION="84"
ARG BOOST_PATCH_VERSION="0"
ARG BOOST_DOT_VERSION="${BOOST_MAJOR_VERSION}.${BOOST_MINOR_VERSION}.${BOOST_PATCH_VERSION}"
ARG BOOST_UNDERSCORE_VERSION="${BOOST_MAJOR_VERSION}_${BOOST_MINOR_VERSION}_${BOOST_PATCH_VERSION}"

# Install Boost
WORKDIR /opt
RUN wget -q https://boostorg.jfrog.io/artifactory/main/release/${BOOST_DOT_VERSION}/source/boost_${BOOST_UNDERSCORE_VERSION}.tar.gz && \
  tar xzf boost_${BOOST_UNDERSCORE_VERSION}.tar.gz
WORKDIR /opt/boost_${BOOST_UNDERSCORE_VERSION}
RUN ./bootstrap.sh --prefix=/opt/boost --with-libraries=system,iostreams,serialization && \
  ./b2 link=static cxxflags=-fPIC cflags=-fPIC install

ENV ROOT=/opt/rdkitsqlite
WORKDIR $ROOT
COPY . $ROOT

# Install cJSON
ENV CJSON_ROOT=/opt/cJSON
RUN git clone https://github.com/DaveGamble/cJSON.git $CJSON_ROOT
RUN mkdir -p $CJSON_ROOT/build
WORKDIR $CJSON_ROOT/build
RUN cmake .. -DBUILD_SHARED_LIBS=OFF
RUN make
RUN make install

# Install RDKit
ENV RDKIT_ROOT=$ROOT/rdkit
RUN git clone https://github.com/rdkit/rdkit.git $RDKIT_ROOT
RUN mkdir -p $RDKIT_ROOT/build
WORKDIR $RDKIT_ROOT/build
RUN cmake -DBoost_INCLUDE_DIR=/opt/boost/include -DRDK_BUILD_FREETYPE_SUPPORT=OFF -DRDK_BUILD_CFFI_LIB=ON -DRDK_BUILD_INCHI_SUPPORT=ON -DRDK_BUILD_PYTHON_WRAPPERS=OFF ..
RUN make -j 2 cffi_test
RUN Code/MinimalLib/cffi_test
RUN mkdir -p $ROOT/lib && cp lib/* $ROOT/lib

# Build library
WORKDIR $ROOT
RUN sed -i '/^LDFLAGS=/ s|$| -I/opt/boost/include|' Makefile
RUN make
RUN cp $ROOT/lib/* /lib
RUN cp $ROOT/build/* /lib

FROM scratch
COPY --from=0 /lib/librdkit* /lib/