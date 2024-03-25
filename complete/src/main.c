/* Add your header comment here */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "librdkitcffi.h"
#include "sqlite3ext.h" /* Do not use <sqlite3.h>! */
SQLITE_EXTENSION_INIT1

/* Insert your extension code here */

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

#ifdef _WIN32
__declspec(dllexport)
#endif
/* TODO: Change the entry point name so that "extension" is replaced by
** text derived from the shared library filename as follows:  Copy every
** ASCII alphabetic character from the filename after the last "/" through
** the next following ".", converting each character to lowercase, and
** discarding the first three characters if they are "lib".
*/
int sqlite3_rdkit_init(
  sqlite3 *db, 
  char **pzErrMsg, 
  const sqlite3_api_routines *pApi
){
  int rc = SQLITE_OK;
  SQLITE_EXTENSION_INIT2(pApi);
  /* Insert here calls to
  **     sqlite3_create_function_v2(),
  **     sqlite3_create_collation_v2(),
  **     sqlite3_create_module_v2(), and/or
  **     sqlite3_vfs_register()
  ** to register the new features that your extension adds.
  */

  enable_logging();
  printf("hello %s\n",version()); 

  rc = sqlite3_create_function(db, "mol", 1,
                   SQLITE_UTF8|SQLITE_INNOCUOUS|SQLITE_DETERMINISTIC,
                   0, mol_search_func, 0, 0);
  /*
  if( rc==SQLITE_OK ){
    rc = sqlite3_create_collation(db, "mol", SQLITE_UTF8, 0, mol_search_coll_func);
  }
  */

  return rc;
}
