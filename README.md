# rdkit-sqlite

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