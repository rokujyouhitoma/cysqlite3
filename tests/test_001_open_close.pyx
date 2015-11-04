cimport sqlite3
from sqlite3 cimport sqlite3, sqlite3_open, sqlite3_close
from sqlite3 cimport sqlite3_errmsg
from sqlite3 cimport SQLITE_OK

def test_xxx():
    cdef sqlite3 *db
    cdef int rc
    filename = ":memory:"
    rc = sqlite3_open(filename, &db)
    if rc != SQLITE_OK:
        print("Can't open database: %s" % sqlite3_errmsg(db))
        sqlite3_close(db)
        return 1
    sqlite3_close(db)
    return 0

assert test_xxx
assert test_xxx() == 0
