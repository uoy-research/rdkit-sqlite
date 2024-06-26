.load build/librdkitsqlite

CREATE TABLE SuccessMol (
    Name TEXT PRIMARY KEY,
    Smiles TEXT,
    Test TEXT
);

INSERT INTO SuccessMol(Name, Smiles, Test)
    VALUES ('PPRBQOOH', 'CCCC(=CC(=O)COO)C(=O)CO', 'CCCC(=CC(=O)COO)C(=O)CO'),
    ('HCOCH2OOH', 'OOCC=O', 'OOCC=O'),
    ('HO25C7', 'CCC(O)CCC(C)O', 'CCC(O)CCC(C)O'),
    ('DDEC3ONE', 'CCCCCCCCCC(=O)CC', 'CCCCCCCCCC(=O)CC'),
    ('DE35TO', 'CCc1cc(C)cc(c1)C(C)[O]', 'CCc1cc(C)cc(c1)C(C)[O]'),
    ('PETOLO2', '[O]OC1(O)C=C(C)C2OOC1(CC)C2O', '[O]OC1(O)C=C(C)C2OOC1(CC)C2O'),
    ('PRCOFORM', 'CCCC(=O)OC=O', 'CCCC(=O)OC=O'),
    ('NOPINDOOH', 'OOC1CC2CC(C1=O)C2(C)C', 'OOC1CC2CC(C1=O)C2(C)C'),
    ('C52OH3OOH', 'CCC(OO)C(C)O', 'CCC(OO)C(C)O'),
    ('MTBEBNO3', 'COC(C)(C)CON(=O)=O', 'COC(C)(C)CON(=O)=O'),
    ('PEBQCO', 'O=CC(=O)C=C(C(=O)CO)CC', 'O=CC(=O)C=C(C(=O)CO)CC'),
    ('CH3CHCLO', 'CC([O])Cl', 'CC([O])Cl'),
    ('C7DCOH', 'CCCC(=O)C(O)C(O)C=O', 'CCCC(=O)C(O)C(O)C=O'),
    ('C918CHO', 'O=CC1(O)CCC2CC1C2(C)C', 'O=CC1(O)CCC2CC1C2(C)C'),
    ('DEMPHOLO2', 'CCC12OOC(CC)(C=C(C)C2(O)O[O])C1O', 'CCC12OOC(CC)(C=C(C)C2(O)O[O])C1O'),
    ('NORLIMO', 'CC([O])(CO)C(CCC(=O)C)C=O', 'CC([O])(CO)C(CCC(=O)C)C=O'),
    ('PXYLOL', 'Cc1ccc(C)c(O)c1', 'Cc1ccc(C)c(O)c1'),
    ('NC623O2', 'OCC(C=O)C(C)(O[O])CO[N+](=O)[O-]', 'OCC(C=O)C(C)(O[O])CO[N+](=O)[O-]'),
    ('CO1M22CO3', '[O]OC(=O)C(C)(C)C=O', '[O]OC(=O)C(C)(C)C=O'),
    ('C9M2CO6O', 'CCC(=O)C=C(C)C([O])C(=O)CC', 'CCC(=O)C=C(C)C([O])C(=O)CC'),
    ('C146O', 'O=CCC([O])C(=O)C1CC(C)(C)C1CCC(=O)C', 'O=CCC([O])C(=O)C1CC(C)(C)C1CCC(=O)C'),
    ('MET1OHNO2', 'CCc1cc(C)cc(N(=O)=O)c1O', 'CCc1cc(C)cc(N(=O)=O)c1O'),
    ('NC728O', 'O=CCC(CO)C(C)([O])CO[N+](=O)[O-]', 'O=CCC(CO)C(C)([O])CO[N+](=O)[O-]'),
    ('HO2CO5C6', 'CC(O)CCC(=O)C', 'CC(O)CCC(=O)C'),
    ('NC91CHO', 'O=CC1(CCC2CC1C2(C)C)ON(=O)=O', 'O=CC1(CCC2CC1C2(C)C)ON(=O)=O'),
    ('CL12PRCOH', 'OC(Cl)C(C)Cl', 'OC(Cl)C(C)Cl'),
    ('IPMLNHY2OH', 'O=C1OC(=O)C(O)(C(C)C)C1O', 'O=C1OC(=O)C(O)(C(C)C)C1O'),
    ('C72OOH', 'OOC(CC(=O)CC)C(C)O', 'OOC(CC(=O)CC)C(C)O'),
    ('NPRACAOH', 'CC(O)COC(=O)C', 'CC(O)COC(=O)C'),
    ('MIPKAOOH', 'OOC(C)(C)C(=O)C', 'OOC(C)(C)C(=O)C'),
    ('C817NO3', 'CC(=O)CCC(CO[N+](=O)[O-])C(=O)C', 'CC(=O)CCC(CO[N+](=O)[O-])C(=O)C'),
    ('EMALNHYOOH', 'CCC1(OO)C(O)C(=O)OC1=O', 'CCC1(OO)C(O)C(=O)OC1=O'),
    ('RN24AO2', '*-O[O]', '*-O[O]'),
    ('C116CO2H', 'O=CCC1C(CC1(C)C)C(=O)CCC(=O)O', 'O=CCC1C(CC1(C)C)C(=O)CCC(=O)O'),
    ('C823NO3', 'OC(=O)CCC(CO[N+](=O)[O-])C(=C)C', 'OC(=O)CCC(CO[N+](=O)[O-])C(=C)C'),
    ('MPHCOMEOOH', 'OOCC(=O)c1ccccc1C', 'OOCC(=O)c1ccccc1C'),
    ('MC3CODBCO2', 'O=CC=C(C)C(=O)[O]', 'O=CC=C(C)C(=O)[O]'),
    ('NIPBNZ1O', 'CC(C)c1cccc(N(=O)=O)c1[O]', 'CC(C)c1cccc(N(=O)=O)c1[O]'),
    ('TOLUENE', 'Cc1ccccc1', 'Cc1ccccc1'),
    ('MXYLOOH', 'OOCc1cccc(C)c1', 'OOCc1cccc(C)c1'),
    ('RTN10O2', '*-O[O]', '*-O[O]'),
    ('NMETLQO', 'CCC1=CC(=O)C(ON(=O)=O)C(C)([O])C1=O', 'CCC1=CC(=O)C(ON(=O)=O)C(C)([O])C1=O'),
    ('CONM2CO2H', 'O=CC(C)(ON(=O)=O)C(=O)O', 'O=CC(C)(ON(=O)=O)C(=O)O'),
    ('C622OOH', 'OOCC(CO)C(=C)C', 'OOCC(CO)C(=C)C'),
    ('LIMALO', 'O=CCC(CCC(=O)C)C(C)([O])CO', 'O=CCC(CCC(=O)C)C(C)([O])CO'),
    ('BIACETOOH', 'CC(=O)C(=O)COO', 'CC(=O)C(=O)COO'),
    ('NPBNZ1OOH', 'CCCc1cccc(N(=O)=O)c1OO', 'CCCc1cccc(N(=O)=O)c1OO'),
    ('BZEMUCO', 'O=CC(O)C([O])C1OC1C=O', 'O=CC(O)C([O])C1OC1C=O'),
    ('TM124BPOOH', 'OOC1(C)C=CC2(C)OOC1(C)C2O', 'OOC1(C)C=CC2(C)OOC1(C)C2O'),
    ('HOC3H6CO3H', 'OCCCC(=O)OO', 'OCCCC(=O)OO');

SELECT * FROM SuccessMol WHERE mol(Smiles) <> Test;

SELECT CASE WHEN EXISTS (
    SELECT * FROM SuccessMol WHERE mol(Smiles) <> Test
) THEN 'status: 1' ELSE 'status: 0' END;