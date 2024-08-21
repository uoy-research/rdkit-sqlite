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

int get_descriptor(char *smiles, char *key, char **value) {
    char *pkl;
    size_t pkl_size;
    
    pkl = get_mol(smiles, &pkl_size, NULL);
    if (pkl == NULL) { return 1; }

    char *descriptors = get_descriptors(pkl, pkl_size);
    free(pkl);

    cJSON *json = cJSON_Parse(descriptors);
    if (json == NULL) { return 2; }

    cJSON *item = cJSON_GetObjectItemCaseSensitive(json, key);
    if (item == NULL) { return 3; }

    char *val = NULL;
    if (cJSON_IsString(item) && (item->valuestring != NULL)) {
        val = strdup(item->valuestring);
    } else if (cJSON_IsNumber(item)) {
        val = (char *)malloc(32);  // Allocate space for the number
        if (val) {
            snprintf(val, 32, "%g", item->valuedouble);
        }
    } else if (cJSON_IsBool(item)) {
        val = strdup(cJSON_IsTrue(item) ? "true" : "false");
    } else if (cJSON_IsNull(item)) {
        val = strdup("null");
    } else {
        val = strdup(cJSON_PrintUnformatted(item));
    }

    cJSON_Delete(json);

    *value = val;
    return 0;
}
