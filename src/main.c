#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "cffiwrapper.h"
#include "sqlite3ext.h" /* Do not use <sqlite3.h>! */
SQLITE_EXTENSION_INIT1

#include "utils.h"

static void mol_search_func(
  sqlite3_context *context,
  int argc,
  sqlite3_value **argv
){
  char *mol_string = (char *)sqlite3_value_text(argv[0]);

  int err = canon_smiles(mol_string);
  if (err != 0) {
    sqlite3_result_error(context, "SMILES parse error", -1);
    sqlite3_result_null(context);
    return;
  }

  sqlite3_result_text(context, mol_string, strlen(mol_string), SQLITE_TRANSIENT);
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

  if (rc != SQLITE_OK) {
    fprintf(stderr, "Error: %s\n", sqlite3_errmsg(db));
    return 1;
  }

  return rc;
}
