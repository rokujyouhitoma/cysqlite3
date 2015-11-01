cimport sqlite3

def test_xxx():
    cdef sqlite3.sqlite3 *db
    cdef int rc
    filename = "./test_sqlite3.db"
    rc = sqlite3.sqlite3_open(filename, &db)
    if rc:
        print("Can't open database: %s" % sqlite3.sqlite3_errmsg(db))
        sqlite3.sqlite3_close(db)
        return
    
    sqlite3.sqlite3_close(db)
    return
