# MCM Advanced Search Tool

## Setup

RDKit CFFI test:

- Copy `librdkitcffi` into `rdkit/lib`
    - `librdkitcffi.h`
    - `librdkitcffi.so.1`
- Create `rdkit/build` directory
- Execute `rdkit/build.sh`
- Execute `rdkit/run.sh`

SQLite extension test:

- Copy MCM database file to `sqlite/data.db`
- Create `sqlite/build` directory
- Execute `sqlite/build.sh`
- Execute `sqlite/run.sh`

Complete test:

- Copy `librdkitcffi` into `complete/lib`
- Copy MCM database file to `complete/data.db`
- Execute `complete/build.sh`
- Execute `complete/run.sh`