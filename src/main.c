#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "cffiwrapper.h"
#include "sqlite3ext.h" /* Do not use <sqlite3.h>! */
SQLITE_EXTENSION_INIT1

static char *canon_smiles(){
  char *pkl;
  size_t pkl_size;
  
  pkl = get_mol("c1cc(O)ccc1",&pkl_size,"");
  char *smiles=get_smiles(pkl,pkl_size,NULL);
  // canon_smiles()
  printf("Canonical SMILES: %s\n",smiles);
  free(pkl);

  return smiles;
}

static void mol_search_func(
  sqlite3_context *context,
  int argc,
  sqlite3_value **argv
){
  //sqlite3_result_text(context, (char*)zOut, i, SQLITE_TRANSIENT);
  //sqlite3_result_text(context, canon_smiles(), i, SQLITE_TRANSIENT);
  sqlite3_result_double(context, strlen(canon_smiles()));
}

int sqlite3_rdkitsqlite_init(
  sqlite3 *db, 
  char **pzErrMsg, 
  const sqlite3_api_routines *pApi
){
  int rc = SQLITE_OK;
  SQLITE_EXTENSION_INIT2(pApi);

  enable_logging();
  printf("hello %s\n",version()); 

  rc = sqlite3_create_function(db, "mol", 1,
                   SQLITE_UTF8|SQLITE_INNOCUOUS|SQLITE_DETERMINISTIC,
                   0, mol_search_func, 0, 0);

  return rc;
}
