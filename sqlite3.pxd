
cdef extern from "<sqlite3.h>":
  cdef char[] SQLITE_VERSION #L113
  cdef int SQLITE_VERSION_NUMBER #L114
  cdef char[] SQLITE_SOURCE_ID #L115
  cdef const char sqlite3_version[] #L147
  cdef extern const char *sqlite3_libversion() #L148
  cdef extern const char *sqlite3_sourceid() #L149
  cdef extern int sqlite3_libversion_number() #L150
  cdef int sqlite3_compileoption_used(const char *zOptName) #L175
  cdef const char *sqlite3_compileoption_get(int N) #L176
  cdef int sqlite3_threadsafe() #L215
  ctypedef struct sqlite3 #L231
  #TODO: support for multy platforms.
  ctypedef long long int sqlite_int64 #L256
  ctypedef unsigned long long int sqlite_uint64 #L257
  ctypedef sqlite_int64 sqlite3_int64 #L259
  ctypedef sqlite_uint64 sqlite3_uint64 #L260
  cdef extern  int sqlite3_close(sqlite3*) #L311
  cdef extern int sqlite3_close(sqlite3*) #L312
  ctypedef int (*sqlite3_callback)(void*,int,char**, char**)
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
  cdef int SQLITE_IOERR_READ = SQLITE_IOERR if SQLITE_IOERR else 1<<8 #L460
  cdef int SQLITE_IOERR_SHORT_READ = SQLITE_IOERR if SQLITE_IOERR else 2<<8
#define SQLITE_IOERR_WRITE             (SQLITE_IOERR | (3<<8))
#define SQLITE_IOERR_FSYNC             (SQLITE_IOERR | (4<<8))
#define SQLITE_IOERR_DIR_FSYNC         (SQLITE_IOERR | (5<<8))
#define SQLITE_IOERR_TRUNCATE          (SQLITE_IOERR | (6<<8))
#define SQLITE_IOERR_FSTAT             (SQLITE_IOERR | (7<<8))
#define SQLITE_IOERR_UNLOCK            (SQLITE_IOERR | (8<<8))
#define SQLITE_IOERR_RDLOCK            (SQLITE_IOERR | (9<<8))
#define SQLITE_IOERR_DELETE            (SQLITE_IOERR | (10<<8))
#define SQLITE_IOERR_BLOCKED           (SQLITE_IOERR | (11<<8))
#define SQLITE_IOERR_NOMEM             (SQLITE_IOERR | (12<<8))
#define SQLITE_IOERR_ACCESS            (SQLITE_IOERR | (13<<8))
#define SQLITE_IOERR_CHECKRESERVEDLOCK (SQLITE_IOERR | (14<<8))
#define SQLITE_IOERR_LOCK              (SQLITE_IOERR | (15<<8))
#define SQLITE_IOERR_CLOSE             (SQLITE_IOERR | (16<<8))
#define SQLITE_IOERR_DIR_CLOSE         (SQLITE_IOERR | (17<<8))
#define SQLITE_IOERR_SHMOPEN           (SQLITE_IOERR | (18<<8))
#define SQLITE_IOERR_SHMSIZE           (SQLITE_IOERR | (19<<8))
#define SQLITE_IOERR_SHMLOCK           (SQLITE_IOERR | (20<<8))
#define SQLITE_IOERR_SHMMAP            (SQLITE_IOERR | (21<<8))
#define SQLITE_IOERR_SEEK              (SQLITE_IOERR | (22<<8))
#define SQLITE_IOERR_DELETE_NOENT      (SQLITE_IOERR | (23<<8))
#define SQLITE_IOERR_MMAP              (SQLITE_IOERR | (24<<8))
#define SQLITE_IOERR_GETTEMPPATH       (SQLITE_IOERR | (25<<8))
#define SQLITE_IOERR_CONVPATH          (SQLITE_IOERR | (26<<8))
#define SQLITE_LOCKED_SHAREDCACHE      (SQLITE_LOCKED |  (1<<8))
#define SQLITE_BUSY_RECOVERY           (SQLITE_BUSY   |  (1<<8))
#define SQLITE_BUSY_SNAPSHOT           (SQLITE_BUSY   |  (2<<8))
#define SQLITE_CANTOPEN_NOTEMPDIR      (SQLITE_CANTOPEN | (1<<8))
#define SQLITE_CANTOPEN_ISDIR          (SQLITE_CANTOPEN | (2<<8))
#define SQLITE_CANTOPEN_FULLPATH       (SQLITE_CANTOPEN | (3<<8))
#define SQLITE_CANTOPEN_CONVPATH       (SQLITE_CANTOPEN | (4<<8))
#define SQLITE_CORRUPT_VTAB            (SQLITE_CORRUPT | (1<<8))
#define SQLITE_READONLY_RECOVERY       (SQLITE_READONLY | (1<<8))
#define SQLITE_READONLY_CANTLOCK       (SQLITE_READONLY | (2<<8))
#define SQLITE_READONLY_ROLLBACK       (SQLITE_READONLY | (3<<8))
#define SQLITE_READONLY_DBMOVED        (SQLITE_READONLY | (4<<8))
#define SQLITE_ABORT_ROLLBACK          (SQLITE_ABORT | (2<<8))
#define SQLITE_CONSTRAINT_CHECK        (SQLITE_CONSTRAINT | (1<<8))
#define SQLITE_CONSTRAINT_COMMITHOOK   (SQLITE_CONSTRAINT | (2<<8))
#define SQLITE_CONSTRAINT_FOREIGNKEY   (SQLITE_CONSTRAINT | (3<<8))
#define SQLITE_CONSTRAINT_FUNCTION     (SQLITE_CONSTRAINT | (4<<8))
#define SQLITE_CONSTRAINT_NOTNULL      (SQLITE_CONSTRAINT | (5<<8))
#define SQLITE_CONSTRAINT_PRIMARYKEY   (SQLITE_CONSTRAINT | (6<<8))
#define SQLITE_CONSTRAINT_TRIGGER      (SQLITE_CONSTRAINT | (7<<8))
#define SQLITE_CONSTRAINT_UNIQUE       (SQLITE_CONSTRAINT | (8<<8))
#define SQLITE_CONSTRAINT_VTAB         (SQLITE_CONSTRAINT | (9<<8))
#define SQLITE_CONSTRAINT_ROWID        (SQLITE_CONSTRAINT |(10<<8))
#define SQLITE_NOTICE_RECOVER_WAL      (SQLITE_NOTICE | (1<<8))
#define SQLITE_NOTICE_RECOVER_ROLLBACK (SQLITE_NOTICE | (2<<8))
#define SQLITE_WARNING_AUTOINDEX       (SQLITE_WARNING | (1<<8)) #L511
  # TODO: CAPI3REF: Flags For File Open Operations
  ctypedef struct sqlite3_file "sqlite3_file" #L645
  ctypedef struct sqlite3_file:
      sqlite3_io_methods *pMethods #647
  ctypedef struct sqlite3_io_methods "sqlite3_io_methods" #L740
  ctypedef struct sqlite3_io_methods:
      int iVersion
      int (*xClose)(sqlite3_file*)
      int (*xRead)(sqlite3_file*, void*, int iAmt, sqlite3_int64 iOfst)
      int (*xWrite)(sqlite3_file*, const void*, int iAmt, sqlite3_int64 iOfst)
      int (*xTruncate)(sqlite3_file*, sqlite3_int64 size)
      int (*xSync)(sqlite3_file*, int flags)
      int (*xFileSize)(sqlite3_file*, sqlite3_int64 *pSize)
      int (*xLock)(sqlite3_file*, int)
      int (*xUnlock)(sqlite3_file*, int)
      int (*xCheckReservedLock)(sqlite3_file*, int *pResOut)
      int (*xFileControl)(sqlite3_file*, int op, void *pArg)
      int (*xSectorSize)(sqlite3_file*)
      int (*xDeviceCharacteristics)(sqlite3_file*)
      int (*xShmMap)(sqlite3_file*, int iPg, int pgsz, int, void **volatile)
      int (*xShmLock)(sqlite3_file*, int offset, int n, int flags)
      void (*xShmBarrier)(sqlite3_file*)
      int (*xShmUnmap)(sqlite3_file*, int deleteFlag)
      int (*xFetch)(sqlite3_file*, sqlite3_int64 iOfst, int iAmt, void **pp)
      int (*xUnfetch)(sqlite3_file*, sqlite3_int64 iOfst, void *p) #L741
  DEF SQLITE_FCNTL_LOCKSTATE = 1
  DEF SQLITE_FCNTL_GET_LOCKPROXYFILE = 2
  DEF SQLITE_FCNTL_SET_LOCKPROXYFILE = 3
  DEF SQLITE_FCNTL_LAST_ERRNO = 4
  DEF SQLITE_FCNTL_SIZE_HINT  = 5
  DEF SQLITE_FCNTL_CHUNK_SIZE = 6
  DEF SQLITE_FCNTL_FILE_POINTER = 7
  DEF SQLITE_FCNTL_SYNC_OMITTED = 8
  DEF SQLITE_FCNTL_WIN32_AV_RETRY = 9
  DEF SQLITE_FCNTL_PERSIST_WAL = 10
  DEF SQLITE_FCNTL_OVERWRITE = 11
  DEF SQLITE_FCNTL_VFSNAME = 12
  DEF SQLITE_FCNTL_POWERSAFE_OVERWRITE = 13
  DEF SQLITE_FCNTL_PRAGMA = 14
  DEF SQLITE_FCNTL_BUSYHANDLER = 15
  DEF SQLITE_FCNTL_TEMPFILENAME = 16
  DEF SQLITE_FCNTL_MMAP_SIZE = 18
  DEF SQLITE_FCNTL_TRACE = 19
  DEF SQLITE_FCNTL_HAS_MOVED = 20
  DEF SQLITE_FCNTL_SYNC = 21
  DEF SQLITE_FCNTL_COMMIT_PHASETWO = 22
  DEF SQLITE_FCNTL_WIN32_SET_HANDLE = 23
  DEF SQLITE_GET_LOCKPROXYFILE = SQLITE_FCNTL_GET_LOCKPROXYFILE
  DEF SQLITE_SET_LOCKPROXYFILE = SQLITE_FCNTL_SET_LOCKPROXYFILE
  DEF SQLITE_LAST_ERRNO = SQLITE_FCNTL_LAST_ERRNO #L991
  ctypedef struct sqlite3_mutex "sqlite3_mutex"
  cdef extern sqlite3_int64 sqlite3_last_insert_rowid(sqlite3*) #L1892
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
  ctypedef struct sqlite3_value
  cdef extern int sqlite3_bind_blob(sqlite3_stmt*, int, const void*, int n, void(*)(void*)) #L3438
  cdef extern int sqlite3_bind_double(sqlite3_stmt*, int, double) #L3438
  cdef extern int sqlite3_bind_int(sqlite3_stmt*, int, int) #L3438
  cdef extern int sqlite3_bind_int64(sqlite3_stmt*, int, sqlite3_int64) #L3438
  cdef extern int sqlite3_bind_null(sqlite3_stmt*, int) #L3438
  cdef extern int sqlite3_bind_text(sqlite3_stmt*, int, const char*, int n, void(*)(void*)) #L3438
  cdef extern int sqlite3_bind_text16(sqlite3_stmt*, int, const void*, int, void(*)(void*)) #L3438
  cdef extern int sqlite3_bind_value(sqlite3_stmt*, int, const sqlite3_value*) #L3438
  cdef extern int sqlite3_bind_zeroblob(sqlite3_stmt*, int, int n) #L3438
  cdef extern int sqlite3_bind_int(sqlite3_stmt*, int, int) #L3439
  cdef extern int sqlite3_bind_text(sqlite3_stmt*,
                                    int,
                                    const char*,
                                    int n,
                                    void(*)(void*)) #L3442
  cdef extern int sqlite3_step(sqlite3_stmt*) #L3720
  cdef extern const void *sqlite3_column_blob(sqlite3_stmt*, int iCol) #L3936
  cdef extern int sqlite3_column_bytes(sqlite3_stmt*, int iCol) #L3937
  cdef extern int sqlite3_column_int(sqlite3_stmt*, int iCol) #L3940
  cdef extern const unsigned char *sqlite3_column_text(sqlite3_stmt*, int iCol) #L3942
  cdef extern int sqlite3_finalize(sqlite3_stmt *pStmt) #L3972
  cdef extern int sqlite3_reset(sqlite3_stmt *pStmt) #L3998
  ctypedef void (*sqlite3_destructor_type)(void*) #L4367
  cdef sqlite3_destructor_type SQLITE_STATIC = <sqlite3_destructor_type>0 #L4368
  cdef sqlite3_destructor_type SQLITE_TRANSIENT = <sqlite3_destructor_type>-1 #L4369
