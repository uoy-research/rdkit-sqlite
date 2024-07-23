.load build/librdkitsqlite

CREATE TABLE FailSmarts (
    Name TEXT PRIMARY KEY,
    Smiles TEXT
);

INSERT INTO FailSmarts(Name, Smiles)
    VALUES ('PPRBQOOH', 'CCCC(=CC(=O)COO)C(=O)CO');

SELECT * FROM FailSmarts WHERE substruct_match(Smiles, 'InvalidSmarts') IS NOT NULL;

SELECT CASE WHEN EXISTS (
    SELECT * FROM FailSmarts WHERE substruct_match(Smiles, 'InvalidSmarts') IS NOT NULL
) THEN 'status: 1' ELSE 'status: 0' END;