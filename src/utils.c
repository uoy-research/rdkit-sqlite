#include "librdkitcffi.h"

char *canon_smiles(char *mol_string){
  char *pkl;
  size_t pkl_size;
  
  pkl = get_mol(mol_string, &pkl_size,"");
  char *smiles=get_smiles(pkl,pkl_size,NULL);
  free(pkl);

  return smiles;
}
