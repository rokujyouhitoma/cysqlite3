cimport sqlite3
from sqlite3 cimport *
#from sqlite3 cimport sqlite3, sqlite3_open, sqlite3_close
#from sqlite3 cimport sqlite3_errmsg
#from sqlite3 cimport sqlite3_stmt, sqlite3_step
#from sqlite3 cimport sqlite3_prepare_v2, sqlite3_column_text
#from sqlite3 cimport sqlite3_exec, sqlite3_free
#from sqlite3 cimport SQLITE_OK, SQLITE_ROW

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
    cdef int rc = sqlite3_open(":memory:", &db)
    if rc != SQLITE_OK:
        print("Can't open database: %s" % sqlite3_errmsg(db))
        sqlite3_close(db)
        return 1
    rc = sqlite3_prepare_v2(db, "SELECT SQLITE_VERSION()", -1, &stmt, NULL)
    if rc != SQLITE_OK:
        print("Failed to fetch data: %s" % sqlite3_errmsg(db))
        sqlite3_close(db)
        return 1
    rc = sqlite3_step(stmt)
    if rc == SQLITE_ROW:
        print("version: %s" % sqlite3_column_text(stmt, 0))
    sqlite3_finalize(stmt)
    sqlite3_close(db)
    return 0

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
