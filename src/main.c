#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "cffiwrapper.h"
#include <cjson/cJSON.h>
#include "sqlite3ext.h" /* Do not use <sqlite3.h>! */
SQLITE_EXTENSION_INIT1

#include "utils.h"

static void mol_substruct_func(
  sqlite3_context *context,
  int argc,
  sqlite3_value **argv
){
  char *smiles = (char *)sqlite3_value_text(argv[0]);
  char *smarts = (char *)sqlite3_value_text(argv[1]);
  int match;

  int err = substruct_match(smiles, smarts, &match);
  if (err != 0) {
    sqlite3_result_null(context);
    return;
  }

  sqlite3_result_int(context, match);
}

static void mol_descriptor_func(
  sqlite3_context *context,
  int argc,
  sqlite3_value **argv
){
  char *smiles = (char *)sqlite3_value_text(argv[0]);
  char *key = (char *)sqlite3_value_text(argv[1]);
  char *value;

  int err = get_descriptor(smiles, key, &value);
  if (err != 0) {
    sqlite3_result_null(context);
    return;
  }

  sqlite3_result_text(context, value, -1, SQLITE_TRANSIENT);
}

int sqlite3_rdkitsqlite_init(
  sqlite3 *db, 
  char **pzErrMsg, 
  const sqlite3_api_routines *pApi
){
  int rc = SQLITE_OK;
  SQLITE_EXTENSION_INIT2(pApi);
  enable_logging();

  sqlite3_create_function(db, "substruct_match", 2,
                   SQLITE_UTF8|SQLITE_INNOCUOUS|SQLITE_DETERMINISTIC,
                   0, mol_substruct_func, 0, 0);

  sqlite3_create_function(db, "get_descriptor", 2,
                   SQLITE_UTF8|SQLITE_INNOCUOUS|SQLITE_DETERMINISTIC,
                   0, mol_descriptor_func, 0, 0);

  if (rc != SQLITE_OK) {
    fprintf(stderr, "Error: %s\n", sqlite3_errmsg(db));
  }
  return rc;
}
