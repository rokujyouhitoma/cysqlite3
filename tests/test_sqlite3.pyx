cimport sqlite3
from sqlite3 cimport *
#from sqlite3 cimport sqlite3, sqlite3_open, sqlite3_close
#from sqlite3 cimport sqlite3_errmsg
#from sqlite3 cimport sqlite3_stmt, sqlite3_step
#from sqlite3 cimport sqlite3_prepare_v2
#from sqlite3 cimport SQLITE_OK

def test_xxx():
    cdef sqlite3 *db
    cdef int rc
    filename = "./test_sqlite3.db"
    rc = sqlite3_open(filename, &db)
    if rc != SQLITE_OK:
        print("Can't open database: %s" % sqlite3_errmsg(db))
        sqlite3_close(db)
        return 1
    sqlite3_close(db)
    return 0

def test_xxx2():
    cdef sqlite3 *db
    cdef sqlite3_stmt *stmt
    cdef int rc = sqlite3_open(":memory:", &db);
    if rc != SQLITE_OK:
        print("Can't open database: %s" % sqlite3_errmsg(db))
        sqlite3_close(db)
        return 1
    rc = sqlite3_prepare_v2(db, "SELECT SQLITE_VERSION()", -1, &stmt, NULL)
    if rc != SQLITE_OK:
        print("Failed to fetch data: %s" % sqlite3_errmsg(db))
        sqlite3_close(db)
        return 1
    rc = sqlite3_step(res)
    
    sqlite3_close(db)
    return 0
