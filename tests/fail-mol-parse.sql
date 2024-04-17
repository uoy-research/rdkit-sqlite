.load build/librdkitsqlite

CREATE TABLE FailMolParse (
    Name TEXT PRIMARY KEY,
    Smiles TEXT
);

INSERT INTO FailMolParse(Name, Smiles)
    VALUES ('PPRBQOOH', 'this is an invalid string');

SELECT mol(SMILES) FROM FailMolParse;