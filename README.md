# rdkit-sqlite

librdkitsqlite is a library to enable use of RDKit functionality via a SQLite extension.

## Usage

The library can be loaded from SQLite as such:

```
.load build/librdkitsqlite
```

## Building

### Docker

A Docker image has been provided containing the library statically linked against its dependencies, to simplify integrating the library into larger projects. An additional image is provided as an example of its usage.

- `docker/lib/Dockerfile` builds a minimal image containing just the library. It cannot be run.
- `docker/demo/Dockerfile` builds the library and starts an interactive SQLite demo session with it loaded.

Both images are provided as packages on the GitHub Container Registry (`ghcr.io/uoy-research/rdkit-sqlite:main` and `ghcr.io/uoy-research/rdkit-sqlite-demo:main`). If you prefer, you can also build them yourself.

Run the following command to build the library image:

`$ docker build -t 'rdkit-sqlite' -f docker/lib/Dockerfile .`

If you would like to run the demo, you can then build and execute it as such:

```
$ docker build -t 'rdkit-sqlite-demo' -f docker/demo/Dockerfile .
$ docker run -it rdkit-sqlite-demo
```

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

The demo Docker image starts an interactive SQLite session with the library pre-loaded.

`$ docker run -it 'ghcr.io/uoy-research/rdkit-sqlite-demo:main'`


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
