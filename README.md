# rdkit-sqlite

librdkitsqlite is a library to enable use of RDKit functionality via a SQLite extension.

## Usage

The library can be loaded from SQLite as such:

```
.load build/librdkitsqlite
```

## Building

### Docker

A Docker image has been provided to simplify integrating the library into larger projects. When run, an interactive SQLite session is started with the library pre-loaded for testing.

A Docker image with the library pre-built is available on the GitHub Container Registry (soon) to speed up building and simplify integrating into larger projects. If you prefer, you can also build the Docker image yourself:

Run the following command:

`$ docker build -t 'rdkitsqlite' .`

### Manual

Install the following dependencies:

- [SQLite](https://www.sqlite.org/)
- [RDKit](https://github.com/rdkit/rdkit) with CFFI

Instructions for compiling RDKit can be found [here](https://github.com/rdkit/rdkit/blob/master/Docs/Book/Install.md). Ensure that you build with CFFI and InChI support enabled. Once complete, run the CFFI tests and install the generated libraries.

Compiling RDKit may fail if you have an outdated version of InChI already installed. Either update the library or uninstall it.

This software can be compiled as such:

```bash
$ make
```

## Usage

### Docker

Running the image starts an interactive SQLite session with the library pre-loaded.

`$ docker run -it 'rdkitsqlite'`

Within in the SQLite session, the following code creates a dummy table with a single molecule and performs a substructure match on it:

```
CREATE TABLE Species (
    Name TEXT PRIMARY KEY,
    Smiles TEXT
);

INSERT INTO Species(Name, Smiles)
    VALUES ('PXYLOL', 'Cc1ccc(C)c(O)c1');

SELECT Name, Smiles, substruct_match(Smiles, 'Oc1[c,n]cccc1') FROM Species;
```

The result should be a match.

## Testing

To test that the functionality is correct:

```bash
$ make test
```

Tests check for correctness and for expected failure responses.
