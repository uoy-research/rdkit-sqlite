# rdkit-sqlite

librdkitsqlite is a library to enable use of RDKit functionality via a SQLite extension.

## Usage

The library can be loaded from SQLite as such:

```
.load build/librdkitsqlite
```

## Building

Install the following dependencies:

- [SQLite](https://www.sqlite.org/)
- [RDKit](https://github.com/rdkit/rdkit) with CFFI

Instructions for compiling RDKit can be found [here](https://github.com/rdkit/rdkit/blob/master/Docs/Book/Install.md). Ensure that you build with CFFI and InChI support enabled. Once complete, run the CFFI tests and install the generated libraries.

Compiling RDKit may fail if you have an outdated version of InChI already installed. Either update the library or uninstall it.

This software can be compiled as such:

```bash
$ make
```

## Testing

To test that the functionality is correct:

```bash
$ make test
```

Tests check for correctness and for expected failure responses.
