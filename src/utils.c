#include "cffiwrapper.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <cjson/cJSON.h>

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

  mol_pkl = get_mol(smiles, &pkl_size, NULL);
  if (mol_pkl == NULL) { return 1; }

  qmol_pkl = get_qmol(smarts, &pkl_size, NULL);
  if (mol_pkl == NULL) { return 2; }

  char *matches = get_substruct_match(mol_pkl, pkl_size, qmol_pkl, pkl_size, NULL);
  if (matches == NULL) { return 3; }

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

int json(char *smiles, char **json) {
  char *pkl;
  size_t pkl_size;
  
  pkl = get_mol(smiles, &pkl_size, NULL);
  if (pkl == NULL) { return 1; }

  *json = get_descriptors(pkl, pkl_size);
  free(pkl);

  /*
  cJSON *node = cJSON_Parse(*json);
  node = cJSON_GetObjectItem(node, "defaults"); 
  node = cJSON_GetObjectItem(node, "atom"); 
  node = cJSON_GetObjectItem(node, "stereo"); 
  *json = cJSON_Print(node);

  // delete the JSON object 
  cJSON_Delete(node); 
  */

  return 0;
}