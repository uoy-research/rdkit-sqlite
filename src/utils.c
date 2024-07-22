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

int substruct_match(char *smiles, char *smarts, int *match) {
  char *mol_pkl;
  char *qmol_pkl;
  size_t pkl_size;
  size_t pkl_size_q;

  mol_pkl = get_mol(smiles, &pkl_size, NULL);
  if (!mol_pkl) { return 1; }

  qmol_pkl = get_qmol(smarts, &pkl_size_q, NULL);
  if (!qmol_pkl) { return 2; }

  char *matches = get_substruct_match(mol_pkl, pkl_size, qmol_pkl, pkl_size_q, NULL);
  if (!matches) { return 3; }

  if (strcmp(matches, "{}")) {
    *match = 1;
  } else {
    *match = 0;
  }

  free(mol_pkl);
  free(qmol_pkl);
  free(matches);

  return 0;
}
