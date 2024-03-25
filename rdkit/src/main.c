#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//#include "cffiwrapper.h"
#include "librdkitcffi.h"

void canon_smiles(){
  char *pkl;
  size_t pkl_size;
  
  pkl = get_mol("c1cc(O)ccc1",&pkl_size,"");
  char *smiles=get_smiles(pkl,pkl_size,NULL);
  printf("Canonical SMILES: %s\n",smiles);
  free(smiles);
  free(pkl);
}

int main(){
  enable_logging();
  printf("hello %s\n",version()); 
  canon_smiles();
  return 0;
}
