.load build/librdkitsqlite

CREATE TABLE SuccessPeroxy (
    Name TEXT PRIMARY KEY,
    Smiles TEXT,
    Test INTEGER
);

INSERT INTO SuccessPeroxy(Name, Smiles, Test)
    VALUES ('PPRBQOOH', 'CCCC(=CC(=O)COO)C(=O)CO', 1),
    ('HCOCH2OOH', 'OOCC=O', 1),
    ('HO25C7', 'CCC(O)CCC(C)O', 0),
    ('DDEC3ONE', 'CCCCCCCCCC(=O)CC', 0),
    ('DE35TO', 'CCc1cc(C)cc(c1)C(C)[O]', 0),
    ('PETOLO2', '[O]OC1(O)C=C(C)C2OOC1(CC)C2O', 1),
    ('PRCOFORM', 'CCCC(=O)OC=O', 0),
    ('NOPINDOOH', 'OOC1CC2CC(C1=O)C2(C)C', 1),
    ('C52OH3OOH', 'CCC(OO)C(C)O', 1),
    ('MTBEBNO3', 'COC(C)(C)CON(=O)=O', 0),
    ('PEBQCO', 'O=CC(=O)C=C(C(=O)CO)CC', 0),
    ('CH3CHCLO', 'CC([O])Cl', 0),
    ('C7DCOH', 'CCCC(=O)C(O)C(O)C=O', 0),
    ('C918CHO', 'O=CC1(O)CCC2CC1C2(C)C', 0),
    ('DEMPHOLO2', 'CCC12OOC(CC)(C=C(C)C2(O)O[O])C1O', 1),
    ('NORLIMO', 'CC([O])(CO)C(CCC(=O)C)C=O', 0),
    ('PXYLOL', 'Cc1ccc(C)c(O)c1', 0),
    ('NC623O2', 'OCC(C=O)C(C)(O[O])CO[N+](=O)[O-]', 1),
    ('CO1M22CO3', '[O]OC(=O)C(C)(C)C=O', 1),
    ('C9M2CO6O', 'CCC(=O)C=C(C)C([O])C(=O)CC', 0),
    ('C146O', 'O=CCC([O])C(=O)C1CC(C)(C)C1CCC(=O)C', 0),
    ('MET1OHNO2', 'CCc1cc(C)cc(N(=O)=O)c1O', 0),
    ('NC728O', 'O=CCC(CO)C(C)([O])CO[N+](=O)[O-]', 0),
    ('HO2CO5C6', 'CC(O)CCC(=O)C', 0),
    ('NC91CHO', 'O=CC1(CCC2CC1C2(C)C)ON(=O)=O', 0),
    ('CL12PRCOH', 'OC(Cl)C(C)Cl', 0),
    ('IPMLNHY2OH', 'O=C1OC(=O)C(O)(C(C)C)C1O', 0),
    ('C72OOH', 'OOC(CC(=O)CC)C(C)O', 1),
    ('NPRACAOH', 'CC(O)COC(=O)C', 0),
    ('MIPKAOOH', 'OOC(C)(C)C(=O)C', 1),
    ('C817NO3', 'CC(=O)CCC(CO[N+](=O)[O-])C(=O)C', 0),
    ('EMALNHYOOH', 'CCC1(OO)C(O)C(=O)OC1=O', 1),
    ('RN24AO2', '*-O[O]', 0),
    ('C116CO2H', 'O=CCC1C(CC1(C)C)C(=O)CCC(=O)O', 0),
    ('C823NO3', 'OC(=O)CCC(CO[N+](=O)[O-])C(=C)C', 0),
    ('MPHCOMEOOH', 'OOCC(=O)c1ccccc1C', 1),
    ('MC3CODBCO2', 'O=CC=C(C)C(=O)[O]', 0),
    ('NIPBNZ1O', 'CC(C)c1cccc(N(=O)=O)c1[O]', 0),
    ('TOLUENE', 'Cc1ccccc1', 0),
    ('MXYLOOH', 'OOCc1cccc(C)c1', 1),
    ('RTN10O2', '*-O[O]', 0),
    ('NMETLQO', 'CCC1=CC(=O)C(ON(=O)=O)C(C)([O])C1=O', 0),
    ('CONM2CO2H', 'O=CC(C)(ON(=O)=O)C(=O)O', 0),
    ('C622OOH', 'OOCC(CO)C(=C)C', 1),
    ('LIMALO', 'O=CCC(CCC(=O)C)C(C)([O])CO', 0),
    ('BIACETOOH', 'CC(=O)C(=O)COO', 1),
    ('NPBNZ1OOH', 'CCCc1cccc(N(=O)=O)c1OO', 0),
    ('BZEMUCO', 'O=CC(O)C([O])C1OC1C=O', 0),
    ('TM124BPOOH', 'OOC1(C)C=CC2(C)OOC1(C)C2O', 1),
    ('HOC3H6CO3H', 'OCCCC(=O)OO', 1);

SELECT * FROM SuccessPeroxy WHERE peroxy(Smiles) <> Test;

SELECT CASE WHEN EXISTS (
    SELECT * FROM SuccessPeroxy WHERE peroxy(Smiles) <> Test
) THEN 'status: 1' ELSE 'status: 0' END;