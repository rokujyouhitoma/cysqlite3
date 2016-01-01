
cdef extern from "<sqlite3.h>":
  cdef char[] SQLITE_VERSION #L113
  cdef int SQLITE_VERSION_NUMBER #L114
  cdef char[] SQLITE_SOURCE_ID #L115
  cdef const char sqlite3_version[] #L147
  cdef extern const char *sqlite3_libversion() #L148
  cdef extern const char *sqlite3_sourceid() #L149
  cdef extern int sqlite3_libversion_number() #L150
  cdef extern int sqlite3_compileoption_used(const char *zOptName) #L175
  cdef extern const char *sqlite3_compileoption_get(int N) #L176
  cdef extern int sqlite3_threadsafe() #L215
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
  DEF SQLITE_OK = 0 #L403
  DEF SQLITE_ERROR = 1
  DEF SQLITE_INTERNAL = 2
  DEF SQLITE_PERM = 3
  DEF SQLITE_ABORT = 4
  DEF SQLITE_BUSY = 5
  DEF SQLITE_LOCKED = 6
  DEF SQLITE_NOMEM = 7
  DEF SQLITE_READONLY = 8
  DEF SQLITE_INTERRUPT = 9
  DEF SQLITE_IOERR = 10
  DEF SQLITE_CORRUPT = 11
  DEF SQLITE_NOTFOUND = 12
  DEF SQLITE_FULL = 13
  DEF SQLITE_CANTOPEN = 14
  DEF SQLITE_PROTOCOL = 15
  DEF SQLITE_EMPTY = 16
  DEF SQLITE_SCHEMA = 17
  DEF SQLITE_TOOBIG = 18
  DEF SQLITE_CONSTRAINT = 19
  DEF SQLITE_MISMATCH = 20
  DEF SQLITE_MISUSE = 21
  DEF SQLITE_NOLFS = 22
  DEF SQLITE_AUTH = 23
  DEF SQLITE_FORMAT = 24
  DEF SQLITE_RANGE = 25
  DEF SQLITE_NOTADB = 26
  DEF SQLITE_NOTICE = 27
  DEF SQLITE_WARNING = 28
  DEF SQLITE_ROW = 100
  DEF SQLITE_DONE = 101 #L434
  DEF SQLITE_IOERR_REA               = (SQLITE_IOERR or (1<<8)) #L460
  DEF SQLITE_IOERR_SHORT_READ        = (SQLITE_IOERR or (2<<8))
  DEF SQLITE_IOERR_WRITE             = (SQLITE_IOERR or (3<<8))
  DEF SQLITE_IOERR_WRITE             = (SQLITE_IOERR or (3<<8))
  DEF SQLITE_IOERR_FSYNC             = (SQLITE_IOERR or (4<<8))
  DEF SQLITE_IOERR_DIR_FSYNC         = (SQLITE_IOERR or (5<<8))
  DEF SQLITE_IOERR_TRUNCATE          = (SQLITE_IOERR or (6<<8))
  DEF SQLITE_IOERR_FSTAT             = (SQLITE_IOERR or (7<<8))
  DEF SQLITE_IOERR_UNLOCK            = (SQLITE_IOERR or (8<<8))
  DEF SQLITE_IOERR_RDLOCK            = (SQLITE_IOERR or (9<<8))
  DEF SQLITE_IOERR_DELETE            = (SQLITE_IOERR or (10<<8))
  DEF SQLITE_IOERR_BLOCKED           = (SQLITE_IOERR or (11<<8))
  DEF SQLITE_IOERR_NOMEM             = (SQLITE_IOERR or (12<<8))
  DEF SQLITE_IOERR_ACCESS            = (SQLITE_IOERR or (13<<8))
  DEF SQLITE_IOERR_CHECKRESERVEDLOCK = (SQLITE_IOERR or (14<<8))
  DEF SQLITE_IOERR_LOCK              = (SQLITE_IOERR or (15<<8))
  DEF SQLITE_IOERR_CLOSE             = (SQLITE_IOERR or (16<<8))
  DEF SQLITE_IOERR_DIR_CLOSE         = (SQLITE_IOERR or (17<<8))
  DEF SQLITE_IOERR_SHMOPEN           = (SQLITE_IOERR or (18<<8))
  DEF SQLITE_IOERR_SHMSIZE           = (SQLITE_IOERR or (19<<8))
  DEF SQLITE_IOERR_SHMLOCK           = (SQLITE_IOERR or (20<<8))
  DEF SQLITE_IOERR_SHMMAP            = (SQLITE_IOERR or (21<<8))
  DEF SQLITE_IOERR_SEEK              = (SQLITE_IOERR or (22<<8))
  DEF SQLITE_IOERR_DELETE_NOENT      = (SQLITE_IOERR or (23<<8))
  DEF SQLITE_IOERR_MMAP              = (SQLITE_IOERR or (24<<8))
  DEF SQLITE_IOERR_GETTEMPPATH       = (SQLITE_IOERR or (25<<8))
  DEF SQLITE_IOERR_CONVPATH          = (SQLITE_IOERR or (26<<8))
  DEF SQLITE_LOCKED_SHAREDCACHE      = (SQLITE_LOCKED or (1<<8))
  DEF SQLITE_BUSY_RECOVERY           = (SQLITE_BUSY or (1<<8))
  DEF SQLITE_BUSY_SNAPSHOT           = (SQLITE_BUSY or (2<<8))
  DEF SQLITE_CANTOPEN_NOTEMPDIR      = (SQLITE_CANTOPEN or (1<<8))
  DEF SQLITE_CANTOPEN_ISDIR          = (SQLITE_CANTOPEN or (2<<8))
  DEF SQLITE_CANTOPEN_FULLPATH       = (SQLITE_CANTOPEN or (3<<8))
  DEF SQLITE_CANTOPEN_CONVPATH       = (SQLITE_CANTOPEN or (4<<8))
  DEF SQLITE_CORRUPT_VTAB            = (SQLITE_CORRUPT or (1<<8))
  DEF SQLITE_READONLY_RECOVERY       = (SQLITE_READONLY or (1<<8))
  DEF SQLITE_READONLY_CANTLOCK       = (SQLITE_READONLY or (2<<8))
  DEF SQLITE_READONLY_ROLLBACK       = (SQLITE_READONLY or (3<<8))
  DEF SQLITE_READONLY_DBMOVED        = (SQLITE_READONLY or (4<<8))
  DEF SQLITE_ABORT_ROLLBACK          = (SQLITE_ABORT or (2<<8))
  DEF SQLITE_CONSTRAINT_CHECK        = (SQLITE_CONSTRAINT or (1<<8))
  DEF SQLITE_CONSTRAINT_COMMITHOOK   = (SQLITE_CONSTRAINT or (2<<8))
  DEF SQLITE_CONSTRAINT_FOREIGNKEY   = (SQLITE_CONSTRAINT or (3<<8))
  DEF SQLITE_CONSTRAINT_FUNCTION     = (SQLITE_CONSTRAINT or (4<<8))
  DEF SQLITE_CONSTRAINT_NOTNULL      = (SQLITE_CONSTRAINT or (5<<8))
  DEF SQLITE_CONSTRAINT_PRIMARYKEY   = (SQLITE_CONSTRAINT or (6<<8))
  DEF SQLITE_CONSTRAINT_TRIGGER      = (SQLITE_CONSTRAINT or (7<<8))
  DEF SQLITE_CONSTRAINT_UNIQUE       = (SQLITE_CONSTRAINT or (8<<8))
  DEF SQLITE_CONSTRAINT_VTAB         = (SQLITE_CONSTRAINT or (9<<8))
  DEF SQLITE_CONSTRAINT_ROWID        = (SQLITE_CONSTRAINT or(10<<8))
  DEF SQLITE_NOTICE_RECOVER_WAL      = (SQLITE_NOTICE or (1<<8))
  DEF SQLITE_NOTICE_RECOVER_ROLLBACK = (SQLITE_NOTICE or (2<<8))
  DEF SQLITE_WARNING_AUTOINDEX       = (SQLITE_WARNING or (1<<8)) #L511
  DEF SQLITE_OPEN_READONLY       = 0x00000001
  DEF SQLITE_OPEN_READWRITE      = 0x00000002
  DEF SQLITE_OPEN_CREATE         = 0x00000004
  DEF SQLITE_OPEN_DELETEONCLOSE  = 0x00000008
  DEF SQLITE_OPEN_EXCLUSIVE      = 0x00000010
  DEF SQLITE_OPEN_AUTOPROXY      = 0x00000020
  DEF SQLITE_OPEN_URI            = 0x00000040
  DEF SQLITE_OPEN_MEMORY         = 0x00000080
  DEF SQLITE_OPEN_MAIN_DB        = 0x00000100
  DEF SQLITE_OPEN_TEMP_DB        = 0x00000200
  DEF SQLITE_OPEN_TRANSIENT_DB   = 0x00000400
  DEF SQLITE_OPEN_MAIN_JOURNAL   = 0x00000800
  DEF SQLITE_OPEN_TEMP_JOURNAL   = 0x00001000
  DEF SQLITE_OPEN_SUBJOURNAL     = 0x00002000
  DEF SQLITE_OPEN_MASTER_JOURNAL = 0x00004000
  DEF SQLITE_OPEN_NOMUTEX        = 0x00008000
  DEF SQLITE_OPEN_FULLMUTEX      = 0x00010000
  DEF SQLITE_OPEN_SHAREDCACHE    = 0x00020000
  DEF SQLITE_OPEN_PRIVATECACHE   = 0x00040000
  DEF SQLITE_OPEN_WAL            = 0x00080000
  DEF SQLITE_OPEN_FILEPROTECTION_COMPLETE                             = 0x00100000
  DEF SQLITE_OPEN_FILEPROTECTION_COMPLETEUNLESSOPEN                   = 0x00200000
  DEF SQLITE_OPEN_FILEPROTECTION_COMPLETEUNTILFIRSTUSERAUTHENTICATION = 0x00300000
  DEF SQLITE_OPEN_FILEPROTECTION_NONE                                 = 0x00400000
  DEF SQLITE_OPEN_FILEPROTECTION_MASK                                 = 0x00700000 #L544
  DEF SQLITE_IOCAP_ATOMIC                = 0x00000001 #L576
  DEF SQLITE_IOCAP_ATOMIC512             = 0x00000002
  DEF SQLITE_IOCAP_ATOMIC1K              = 0x00000004
  DEF SQLITE_IOCAP_ATOMIC2K              = 0x00000008
  DEF SQLITE_IOCAP_ATOMIC4K              = 0x00000010
  DEF SQLITE_IOCAP_ATOMIC8K              = 0x00000020
  DEF SQLITE_IOCAP_ATOMIC16K             = 0x00000040
  DEF SQLITE_IOCAP_ATOMIC32K             = 0x00000080
  DEF SQLITE_IOCAP_ATOMIC64K             = 0x00000100
  DEF SQLITE_IOCAP_SAFE_APPEND           = 0x00000200
  DEF SQLITE_IOCAP_SEQUENTIAL            = 0x00000400
  DEF SQLITE_IOCAP_UNDELETABLE_WHEN_OPEN = 0x00000800
  DEF SQLITE_IOCAP_POWERSAFE_OVERWRITE   = 0x00001000
  DEF SQLITE_IOCAP_IMMUTABLE             = 0x00002000 #L589
  DEF SQLITE_LOCK_NONE          = 0 #L598
  DEF SQLITE_LOCK_SHARED        = 1
  DEF SQLITE_LOCK_RESERVED      = 2
  DEF SQLITE_LOCK_PENDING       = 3
  DEF SQLITE_LOCK_EXCLUSIVE     = 4 #L602
  DEF SQLITE_SYNC_NORMAL        = 0x00002 #L630
  DEF SQLITE_SYNC_FULL          = 0x00003
  DEF SQLITE_SYNC_DATAONLY      = 0x00010 #L632
  # TODO: CAPI3REF: Flags For File Open Operations
  ctypedef struct sqlite3_file "sqlite3_file" #L645
  ctypedef struct sqlite3_file:
      const sqlite3_io_methods *pMethods #647
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
  DEF SQLITE_FCNTL_LOCKSTATE           = 1
  DEF SQLITE_FCNTL_GET_LOCKPROXYFILE   = 2
  DEF SQLITE_FCNTL_SET_LOCKPROXYFILE   = 3
  DEF SQLITE_FCNTL_LAST_ERRNO          = 4
  DEF SQLITE_FCNTL_SIZE_HINT           = 5
  DEF SQLITE_FCNTL_CHUNK_SIZE          = 6
  DEF SQLITE_FCNTL_FILE_POINTER        = 7
  DEF SQLITE_FCNTL_SYNC_OMITTED        = 8
  DEF SQLITE_FCNTL_WIN32_AV_RETRY      = 9
  DEF SQLITE_FCNTL_PERSIST_WAL         = 10
  DEF SQLITE_FCNTL_OVERWRITE           = 11
  DEF SQLITE_FCNTL_VFSNAME             = 12
  DEF SQLITE_FCNTL_POWERSAFE_OVERWRITE = 13
  DEF SQLITE_FCNTL_PRAGMA              = 14
  DEF SQLITE_FCNTL_BUSYHANDLER         = 15
  DEF SQLITE_FCNTL_TEMPFILENAME        = 16
  DEF SQLITE_FCNTL_MMAP_SIZE           = 18
  DEF SQLITE_FCNTL_TRACE               = 19
  DEF SQLITE_FCNTL_HAS_MOVED           = 20
  DEF SQLITE_FCNTL_SYNC                = 21
  DEF SQLITE_FCNTL_COMMIT_PHASETWO     = 22
  DEF SQLITE_FCNTL_WIN32_SET_HANDLE    = 23 #L987
  DEF SQLITE_GET_LOCKPROXYFILE = SQLITE_FCNTL_GET_LOCKPROXYFILE #L989
  DEF SQLITE_SET_LOCKPROXYFILE = SQLITE_FCNTL_SET_LOCKPROXYFILE
  DEF SQLITE_LAST_ERRNO        = SQLITE_FCNTL_LAST_ERRNO #L991
  ctypedef struct sqlite3_mutex "sqlite3_mutex" #L1003
  ctypedef struct sqlite3_vfs "sqlite3_vfs" #L1162
  ctypedef void (*sqlite3_syscall_ptr)() #L1163
  ctypedef struct sqlite3_vfs: #L1164
    int iVersion
    int szOsFile
    int mxPathname
    sqlite3_vfs *pNext
    const char *zName
    void *pAppData
    int (*xOpen)(sqlite3_vfs*, const char *zName, sqlite3_file*,
                 int flags, int *pOutFlags)
    int (*xDelete)(sqlite3_vfs*, const char *zName, int syncDir)
    int (*xAccess)(sqlite3_vfs*, const char *zName, int flags, int *pResOut)
    int (*xFullPathname)(sqlite3_vfs*, const char *zName, int nOut, char *zOut)
    void *(*xDlOpen)(sqlite3_vfs*, const char *zFilename)
    void (*xDlError)(sqlite3_vfs*, int nByte, char *zErrMsg)
    void (*(*xDlSym)(sqlite3_vfs*,void*, const char *zSymbol))()
    void (*xDlClose)(sqlite3_vfs*, void*)
    int (*xRandomness)(sqlite3_vfs*, int nByte, char *zOut)
    int (*xSleep)(sqlite3_vfs*, int microseconds)
    int (*xCurrentTime)(sqlite3_vfs*, double*)
    int (*xGetLastError)(sqlite3_vfs*, int, char *)
    int (*xCurrentTimeInt64)(sqlite3_vfs*, sqlite3_int64*)
    int (*xSetSystemCall)(sqlite3_vfs*, const char *zName, sqlite3_syscall_ptr)
    sqlite3_syscall_ptr (*xGetSystemCall)(sqlite3_vfs*, const char *zName)
    const char *(*xNextSystemCall)(sqlite3_vfs*, const char *zName)

  DEF SQLITE_ACCESS_EXISTS    = 0 #L1223
  DEF SQLITE_ACCESS_READWRITE = 1 #L1224
  DEF SQLITE_ACCESS_READ      = 2 #L1225
  DEF SQLITE_SHM_UNLOCK = 1 #L1249
  DEF SQLITE_SHM_LOCK   = 2 #L1250
  DEF SQLITE_SHM_SHARED = 4 #L1251
  DEF SQLITE_SHM_EXCLUSIVE = 8 #L1252
  DEF SQLITE_SHM_NLOCK = 8 #L1262
  cdef int sqlite3_initialize() #L1340
  cdef int sqlite3_shutdown() #L1341
  cdef int sqlite3_os_init() #L1342
  cdef int sqlite3_os_end() #L1343
  cdef int sqlite3_config(int, ...) #L1374
  cdef int sqlite3_db_config(sqlite3*, int op, ...) #L1392
  ctypedef struct sqlite3_mem_methods "sqlite3_mem_methods" #L1457
  ctypedef struct sqlite3_mem_methods: #L1458
    void *(*xMalloc)(int)
    void (*xFree)(void*)
    void *(*xRealloc)(void*,int)
    int (*xSize)(void*)
    int (*xRoundup)(int)
    int (*xInit)(void*)
    void (*xShutdown)(void*)
    void *pAppData
  DEF SQLITE_CONFIG_SINGLETHREAD = 1 #L1747
  DEF SQLITE_CONFIG_MULTITHREAD  = 2
  DEF SQLITE_CONFIG_SERIALIZED   = 3
  DEF SQLITE_CONFIG_MALLOC       = 4
  DEF SQLITE_CONFIG_GETMALLOC    = 5
  DEF SQLITE_CONFIG_SCRATCH      = 6
  DEF SQLITE_CONFIG_PAGECACHE    = 7
  DEF SQLITE_CONFIG_HEAP         = 8
  DEF SQLITE_CONFIG_MEMSTATUS    = 9
  DEF SQLITE_CONFIG_MUTEX        = 10
  DEF SQLITE_CONFIG_GETMUTEX     = 11 #L1757
  DEF SQLITE_CONFIG_LOOKASIDE    = 13 #L1759
  DEF SQLITE_CONFIG_PCACHE       = 14
  DEF SQLITE_CONFIG_GETPCACHE    = 15
  DEF SQLITE_CONFIG_LOG          = 16
  DEF SQLITE_CONFIG_URI          = 17
  DEF SQLITE_CONFIG_PCACHE2      = 18
  DEF SQLITE_CONFIG_GETPCACHE2   = 19
  DEF SQLITE_CONFIG_COVERING_INDEX_SCAN = 20
  DEF SQLITE_CONFIG_SQLLOG       = 21
  DEF SQLITE_CONFIG_MMAP_SIZE    = 22
  DEF SQLITE_CONFIG_WIN32_HEAPSIZE      = 23 #1769
  DEF SQLITE_DBCONFIG_LOOKASIDE       = 1001 #L1829
  DEF SQLITE_DBCONFIG_ENABLE_FKEY     = 1002
  DEF SQLITE_DBCONFIG_ENABLE_TRIGGER  = 1003 #L1831
  cdef extern int sqlite3_extended_result_codes(sqlite3*, int onoff) #L1841
  cdef extern sqlite3_int64 sqlite3_last_insert_rowid(sqlite3*) #L1892
  cdef extern int sqlite3_changes(sqlite3*) #L1946
  cdef extern int sqlite3_total_changes(sqlite3*) #L1972
  cdef extern void sqlite3_interrupt(sqlite3*) #L2011
  cdef extern int sqlite3_complete(const char *sql) #L2046
  cdef extern int sqlite3_complete16(const void *sql) #L2047
  cdef extern int sqlite3_busy_handler(sqlite3*, int(*)(void*,int), void*) #L2113
  cdef extern int sqlite3_busy_timeout(sqlite3*, int ms) #L2133
  cdef extern int sqlite3_get_table( #L2207
      sqlite3 *db,
      const char *zSql,
      char ***pazResult,
      int *pnRow,
      int *pnColumn,
      char **pzErrmsg)
  cdef extern void sqlite3_free_table(char **result) #L2215
  cdef extern char *sqlite3_mprintf(const char*,...) #L2312
  cdef extern char *sqlite3_vmprintf(const char*, va_list) #L2313
  cdef extern char *sqlite3_snprintf(int,char*,const char*, ...) #L2314
  cdef extern char *sqlite3_vsnprintf(int,char*,const char*, va_list) #L2315
  cdef extern void *sqlite3_malloc(int) #L2386
  cdef extern void *sqlite3_realloc(void*, int) #L2387
  cdef extern void sqlite3_free(void*) #L2388
  cdef extern sqlite3_int64 sqlite3_memory_used() #L2413
  cdef extern sqlite3_int64 sqlite3_memory_highwater(int resetFlag) #L2414
  cdef extern void sqlite3_randomness(int N, void *P) #L2436
  cdef extern int sqlite3_set_authorizer( #L2518
      sqlite3*,
      int (*xAuth)(void*,int,const char*,const char*,const char*,const char*),
      void *pUserData)
  DEF SQLITE_DENY = 1 #L2536
  DEF SQLITE_IGNORE = 2 #L2537
  DEF SQLITE_CREATE_INDEX         =  1 #L2559
  DEF SQLITE_CREATE_TABLE         =  2
  DEF SQLITE_CREATE_TEMP_INDEX    =  3
  DEF SQLITE_CREATE_TEMP_TABLE    =  4
  DEF SQLITE_CREATE_TEMP_TRIGGER  =  5
  DEF SQLITE_CREATE_TEMP_VIEW     =  6
  DEF SQLITE_CREATE_TRIGGER       =  7
  DEF SQLITE_CREATE_VIEW          =  8
  DEF SQLITE_DELETE               =  9
  DEF SQLITE_DROP_INDEX           = 10
  DEF SQLITE_DROP_TABLE           = 11
  DEF SQLITE_DROP_TEMP_INDEX      = 12
  DEF SQLITE_DROP_TEMP_TABLE      = 13
  DEF SQLITE_DROP_TEMP_TRIGGER    = 14
  DEF SQLITE_DROP_TEMP_VIEW       = 15
  DEF SQLITE_DROP_TRIGGER         = 16
  DEF SQLITE_DROP_VIEW            = 17
  DEF SQLITE_INSERT               = 18
  DEF SQLITE_PRAGMA               = 19
  DEF SQLITE_READ                 = 20
  DEF SQLITE_SELECT               = 21
  DEF SQLITE_TRANSACTION          = 22
  DEF SQLITE_UPDATE               = 23
  DEF SQLITE_ATTACH               = 24
  DEF SQLITE_DETACH               = 25
  DEF SQLITE_ALTER_TABLE          = 26
  DEF SQLITE_REINDEX              = 27
  DEF SQLITE_ANALYZE              = 28
  DEF SQLITE_CREATE_VTABLE        = 29
  DEF SQLITE_DROP_VTABLE          = 30
  DEF SQLITE_FUNCTION             = 31
  DEF SQLITE_SAVEPOINT            = 32
  DEF SQLITE_COPY                 =  0
  DEF SQLITE_RECURSIVE            = 33 #L2592
  cdef extern void *sqlite3_trace(sqlite3*, void(*xTrace)(void*,const char*), void*) #L2622
  cdef extern void *sqlite3_profile(sqlite3*,
                             void(*xProfile)(void*,const char*,sqlite3_uint64), void*) #L2623
  cdef extern void sqlite3_progress_handler(sqlite3*, int, int(*)(void*), void*) #L2657
  cdef extern int sqlite3_open(const char *filename, sqlite3 **ppDb) #L2886
  cdef extern int sqlite3_open16( #L2890
      const void *filename,
      sqlite3 **ppDb)
  cdef extern int sqlite3_open_v2( #L2894
      const char *filename,
      sqlite3 **ppDb,
      int flags,
      const char *zVfs)

  cdef extern const char *sqlite3_uri_parameter(const char *zFilename, const char *zParam) #L2940
  cdef extern int sqlite3_uri_boolean(const char *zFile, const char *zParam, int bDefault) #L2941
  cdef extern sqlite3_int64 sqlite3_uri_int64(const char*, const char*, sqlite3_int64) #L2942
  cdef extern int sqlite3_errcode(sqlite3 *db) #L2985
  cdef extern int sqlite3_extended_errcode(sqlite3 *db) #L2985
  cdef extern const char *sqlite3_errmsg(sqlite3*) #L2986
  cdef extern const void *sqlite3_errmsg16(sqlite3*) #L2987
  cdef extern const char *sqlite3_errstr(int) #L2988
  ctypedef struct sqlite3_stmt "sqlite3_stmt" #L3013
  extern int sqlite3_limit(sqlite3*, int id, int newVal) #L3054
  DEF SQLITE_LIMIT_LENGTH                  =  0 #L3108
  DEF SQLITE_LIMIT_SQL_LENGTH              =  1
  DEF SQLITE_LIMIT_COLUMN                  =  2
  DEF SQLITE_LIMIT_EXPR_DEPTH              =  3
  DEF SQLITE_LIMIT_COMPOUND_SELECT         =  4
  DEF SQLITE_LIMIT_VDBE_OP                 =  5
  DEF SQLITE_LIMIT_FUNCTION_ARG            =  6
  DEF SQLITE_LIMIT_ATTACHED                =  7
  DEF SQLITE_LIMIT_LIKE_PATTERN_LENGTH     =  8
  DEF SQLITE_LIMIT_VARIABLE_NUMBER         =  9
  DEF SQLITE_LIMIT_TRIGGER_DEPTH           = 10 #L3118
  cdef extern int sqlite3_prepare( #L3201
      sqlite3 *db,
      const char *zSql,
      int nByte,
      sqlite3_stmt **ppStmt,
      const char **pzTail)
  cdef extern int sqlite3_prepare_v2( #L3208
      sqlite3 *db,
      const char *zSql,
      int nByte,
      sqlite3_stmt **ppStmt,
      const char **pzTail)
  cdef extern int sqlite3_prepare16( #L3215
      sqlite3 *db,
      const void *zSql,
      int nByte,
      sqlite3_stmt **ppStmt,
      const void **pzTail)
  cdef int sqlite3_prepare16_v2( #L3222
      sqlite3 *db,
      const void *zSql,
      int nByte,
      sqlite3_stmt **ppStmt,
      const void **pzTail)
  cdef extern const char *sqlite3_sql(sqlite3_stmt *pStmt) #L3237
  cdef extern int sqlite3_stmt_readonly(sqlite3_stmt *pStmt) #L3268
  cdef extern int sqlite3_stmt_busy(sqlite3_stmt*) #L3287
  ctypedef struct Mem "sqlite3_value" #L3326
  ctypedef struct sqlite3_context "sqlite3_context" #L3340

  #TODO

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
