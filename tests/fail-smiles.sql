.load build/librdkitsqlite

CREATE TABLE FailSmiles (
    Name TEXT PRIMARY KEY,
    Smiles TEXT
);

INSERT INTO FailSmiles(Name, Smiles)
    VALUES ('TestMol', 'InvalidSmiles');

SELECT * FROM FailSmiles WHERE substruct_match(Smiles, 'O') IS NOT NULL;

SELECT CASE WHEN EXISTS (
    SELECT * FROM FailSmiles WHERE substruct_match(Smiles, 'O') IS NOT NULL
) THEN 'status: 1' ELSE 'status: 0' END;