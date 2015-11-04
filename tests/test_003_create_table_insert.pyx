cimport sqlite3
from sqlite3 cimport sqlite3, sqlite3_open, sqlite3_close
from sqlite3 cimport sqlite3_errmsg
from sqlite3 cimport sqlite3_exec, sqlite3_free
from sqlite3 cimport sqlite3_last_insert_rowid
from sqlite3 cimport SQLITE_OK

def test_xxx3():
    cdef sqlite3 *db
    cdef char *err_msg = NULL
    cdef int rc = sqlite3_open(":memory:", &db)
    if rc != SQLITE_OK:
        print("Can't open database: %s" % sqlite3_errmsg(db))
        sqlite3_close(db)
        return 1
    cdef char *sql = """DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars(Id INT, Name TEXT, Price INT);
INSERT INTO Cars VALUES(1, 'Century', 12538286);
INSERT INTO Cars VALUES(2, 'Lexus LS600h version L', 12868000);
INSERT INTO Cars VALUES(3, 'Crown Sedan', 3058560);"""
    rc = sqlite3_exec(db, sql, NULL, NULL, &err_msg)
    if rc != SQLITE_OK:
        print("SQL error: %s" % err_msg)
        sqlite3_free(err_msg)
        sqlite3_close(db)
        return 1
    sqlite3_close(db)
    return 0

assert test_xxx3
assert test_xxx3() == 0
