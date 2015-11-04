cimport sqlite3
from sqlite3 cimport sqlite3, sqlite3_open, sqlite3_close
from sqlite3 cimport sqlite3_errmsg
from sqlite3 cimport sqlite3_exec, sqlite3_free
from sqlite3 cimport sqlite3_last_insert_rowid
from sqlite3 cimport SQLITE_OK

def test_xxx4():
    cdef sqlite3 *db
    cdef char *err_msg = NULL
    cdef int rc = sqlite3_open(":memory:", &db)
    if rc != SQLITE_OK:
        print("Can't open database: %s" % sqlite3_errmsg(db))
        sqlite3_close(db)
        return 1
    cdef char *sql = """DROP TABLE IF EXISTS Friends;
CREATE TABLE Friends(Id INTEGER PRIMARY KEY, Name TEXT);
INSERT INTO Friends VALUES(1, 'Guido');
INSERT INTO Friends VALUES(2, 'Rigo');"""
    rc = sqlite3_exec(db, sql, NULL, NULL, &err_msg)
    if rc != SQLITE_OK:
        print("SQL error: %s" % err_msg)
        sqlite3_free(err_msg)
        sqlite3_close(db)
        return 1
    cdef int last_id = sqlite3_last_insert_rowid(db)
    print("last_insert_rowid: %s" % last_id)
    sqlite3_close(db)
    return 0

assert test_xxx4
assert test_xxx4() == 0
