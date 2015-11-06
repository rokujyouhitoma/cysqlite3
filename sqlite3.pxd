
cdef extern from "<sqlite3.h>":
  cdef char[] SQLITE_VERSION #L113
  cdef int SQLITE_VERSION_NUMBER #L114
  cdef char[] SQLITE_SOURCE_ID #L115
  ctypedef struct sqlite3 #L231
  #TODO: support for multy platforms.
  ctypedef long long int sqlite_int64 #L256
  ctypedef sqlite_int64 sqlite3_int64 #L259
  cdef extern int sqlite3_close(sqlite3*) #L312
  cdef extern int sqlite3_exec(
      sqlite3*,
      const char *sql,
      int (*callback)(void*,int,char**,char**),
      void *,
      char **errmsg) #L382
  cdef int SQLITE_OK #L403
  cdef int SQLITE_ERROR
  cdef int SQLITE_INTERNAL
  cdef int SQLITE_PERM
  cdef int SQLITE_ABORT
  cdef int SQLITE_BUSY
  cdef int SQLITE_LOCKED
  cdef int SQLITE_NOMEM
  cdef int SQLITE_READONLY
  cdef int SQLITE_INTERRUPT
  cdef int SQLITE_IOERR
  cdef int SQLITE_CORRUPT
  cdef int SQLITE_NOTFOUND
  cdef int SQLITE_FULL
  cdef int SQLITE_CANTOPEN
  cdef int SQLITE_PROTOCOL
  cdef int SQLITE_EMPTY
  cdef int SQLITE_SCHEMA
  cdef int SQLITE_TOOBIG
  cdef int SQLITE_CONSTRAINT
  cdef int SQLITE_MISMATCH
  cdef int SQLITE_MISUSE
  cdef int SQLITE_NOLFS
  cdef int SQLITE_AUTH
  cdef int SQLITE_FORMAT
  cdef int SQLITE_RANGE
  cdef int SQLITE_NOTADB
  cdef int SQLITE_NOTICE
  cdef int SQLITE_WARNING
  cdef int SQLITE_ROW
  cdef int SQLITE_DONE #L434
  cdef extern sqlite3_int64 sqlite3_last_insert_rowid(sqlite3*)
  cdef extern void sqlite3_free(void*) #L2388
  cdef extern int sqlite3_open(const char *filename, sqlite3 **ppDb) #L2886
  cdef extern const char *sqlite3_errmsg(sqlite3*) #L2986
  ctypedef struct sqlite3_stmt #L3013
  cdef extern int sqlite3_prepare(
      sqlite3 *db,
      const char *zSql,
      int nByte,
      sqlite3_stmt **ppStmt,
      const char **pzTail) #L3208
  cdef extern int sqlite3_prepare_v2(
      sqlite3 *db,
      const char *zSql,
      int nByte,
      sqlite3_stmt **ppStmt,
      const char **pzTail) #L3208
  cdef extern int sqlite3_bind_text(sqlite3_stmt*,
                                    int,
                                    const char*,
                                    int n,
                                    void(*)(void*)) #L3442
  cdef extern int sqlite3_step(sqlite3_stmt*) #L3720
  cdef extern int sqlite3_column_int(sqlite3_stmt*, int iCol) #L3940
  cdef extern const unsigned char *sqlite3_column_text(sqlite3_stmt*, int iCol) #L3942
  cdef extern int sqlite3_finalize(sqlite3_stmt *pStmt) #L3972
  cdef extern int sqlite3_reset(sqlite3_stmt *pStmt) #L3998
  ctypedef void (*sqlite3_destructor_type)(void*) #L4368
