#include "cffiwrapper.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int canon_smiles(char *smiles) {
  char *pkl;
  size_t pkl_size;
  
  pkl = get_mol(smiles, &pkl_size, NULL);
  if (pkl == NULL) { return 1; }

  smiles = get_smiles(pkl, pkl_size, NULL);
  free(pkl);

  return 0;
}

int substruct_match(char *smiles, char *smarts, char **match) {
  char *mol_pkl;
  char *qmol_pkl;
  size_t pkl_size;

  printf("1");
  
  mol_pkl = get_mol(smiles, &pkl_size, NULL);
  if (mol_pkl == NULL) { return 1; }

  printf("2");

  qmol_pkl = get_qmol(smarts, &pkl_size, NULL);
  if (mol_pkl == NULL) { return 2; }

  *match = get_substruct_match(mol_pkl, pkl_size, qmol_pkl, pkl_size, NULL);
  if (*match == NULL) { return 3; }
  printf("3");

  free(mol_pkl);
  free(qmol_pkl);

  return 0;
}