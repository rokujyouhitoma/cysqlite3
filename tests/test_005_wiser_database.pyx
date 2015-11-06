__LICENSE__ = """Today Ike Tohru 11:31pm Ike Tohru
   hi
   かなり以前に話してたCythonでwiserをラップというのを始めたのだけど、
   wiserのライセンス付与頂きたい or そもそもライセンスありますか？
   なければ、公開あきらめるんご
 Tasuku Suenaga 11/5, 11:32pm Tasuku Suenaga
   おおー、ぜひぜひ公開あれ
   ライセンスはない
 Ike Tohru 11:32pm Ike Tohru
   !!!
   ”ライセンスはない”って記載しとく
   ありがとう！
 Tasuku Suenaga 11/5, 11:33pm Tasuku Suenaga
   LOVE!
 Ike Tohru 11:33pm Ike Tohru
   Love too!"""
cimport sqlite3
from sqlite3 cimport sqlite3, sqlite3_open, sqlite3_close
from sqlite3 cimport sqlite3_stmt
from sqlite3 cimport sqlite3_step, sqlite3_column_int
from sqlite3 cimport sqlite3_exec, sqlite3_prepare
from sqlite3 cimport sqlite3_bind_text
from sqlite3 cimport sqlite3_finalize, sqlite3_reset
from sqlite3 cimport sqlite3_errmsg
from sqlite3 cimport SQLITE_OK, SQLITE_ROW
#from sqlite3 cimport SQLITE_STATIC

# Translate it from wiser/wiser.h
cdef struct _wiser_env:
    const char *db_path
    # int token_len
    # compress_method compress
    # int enable_phrase_search
    # inverted_index_hash *ii_buffer
    # int ii_buffer_count
    # int ii_buffer_update_threshold
    # int indexed_count
    sqlite3 *db
    sqlite3_stmt *get_document_id_st
    sqlite3_stmt *get_document_title_st
    sqlite3_stmt *insert_document_st
    sqlite3_stmt *update_document_st
    sqlite3_stmt *get_token_id_st
    sqlite3_stmt *get_token_st
    sqlite3_stmt *store_token_st
    sqlite3_stmt *get_postings_st
    sqlite3_stmt *update_postings_st
    sqlite3_stmt *get_settings_st
    sqlite3_stmt *replace_settings_st
    sqlite3_stmt *get_document_count_st
    sqlite3_stmt *begin_st
    sqlite3_stmt *commit_st
    sqlite3_stmt *rollback_st
ctypedef _wiser_env wiser_env

# Translate it from wiser/database.c
cdef int init_database(wiser_env *env, const char *db_path):
    cdef int rc = sqlite3_open(db_path, &env.db)
    if rc == SQLITE_OK:
        print("cannot open database: %s" % sqlite3_errmsg(env.db))
        return rc
    sqlite3_exec(env.db,
                 """CREATE TABLE documents (
id      INTEGER PRIMARY KEY," /* auto increment */
title   TEXT NOT NULL,
body    TEXT NOT NULL);""",
                 NULL, NULL, NULL)
    sqlite3_exec(env.db,
                 """CREATE TABLE documents (
id      INTEGER PRIMARY KEY," /* auto increment */
title   TEXT NOT NULL,
body    TEXT NOT NULL);""",
                 NULL, NULL, NULL)
    sqlite3_exec(env.db,
                 """CREATE TABLE tokens (
id         INTEGER PRIMARY KEY,
token      TEXT NOT NULL,
docs_count INT NOT NULL,
postings   BLOB NOT NULL);""",
                 NULL, NULL, NULL)
    sqlite3_exec(env.db,
                 "CREATE UNIQUE INDEX token_index ON tokens(token);",
                 NULL, NULL, NULL)
    sqlite3_exec(env.db,
                 "CREATE UNIQUE INDEX title_index ON documents(title);" ,
                 NULL, NULL, NULL)
    sqlite3_prepare(env.db,
                    "SELECT id FROM documents WHERE title = ?;",
                    -1, &env.get_document_id_st, NULL)
    sqlite3_prepare(env.db,
                    "SELECT title FROM documents WHERE id = ?;",
                    -1, &env.get_document_title_st, NULL)
    sqlite3_prepare(env.db,
                    "INSERT INTO documents (title, body) VALUES (?, ?);",
                    -1, &env.insert_document_st, NULL)
    sqlite3_prepare(env.db,
                    "UPDATE documents set body = ? WHERE id = ?;",
                    -1, &env.update_document_st, NULL)
    sqlite3_prepare(env.db,
                    "SELECT id, docs_count FROM tokens WHERE token = ?;",
                    -1, &env.get_token_id_st, NULL)
    sqlite3_prepare(env.db,
                    "SELECT token FROM tokens WHERE id = ?;",
                    -1, &env.get_token_st, NULL)
    sqlite3_prepare(env.db,
                     "INSERT OR IGNORE INTO tokens (token, docs_count, postings) VALUES (?, 0, ?);",
                    -1, &env.store_token_st, NULL)
    sqlite3_prepare(env.db,
                    "SELECT docs_count, postings FROM tokens WHERE id = ?;",
                    -1, &env.get_postings_st, NULL)
    sqlite3_prepare(env.db,
                    "UPDATE tokens SET docs_count = ?, postings = ? WHERE id = ?;",
                    -1, &env.update_postings_st, NULL)
    sqlite3_prepare(env.db,
                   "SELECT value FROM settings WHERE key = ?;",
                    -1, &env.get_settings_st, NULL)
    sqlite3_prepare(env.db,
                    "INSERT OR REPLACE INTO settings (key, value) VALUES (?, ?);",
                    -1, &env.replace_settings_st, NULL)
    sqlite3_prepare(env.db,
                    "SELECT COUNT(*) FROM documents;",
                    -1, &env.get_document_count_st, NULL)
    sqlite3_prepare(env.db,
                    "BEGIN;",
                    -1, &env.begin_st, NULL)
    sqlite3_prepare(env.db,
                    "COMMIT;",
                    -1, &env.commit_st, NULL)
    sqlite3_prepare(env.db,
                    "ROLLBACK;",
                    -1, &env.rollback_st, NULL);
    return 0

# Translate it from wiser/database.c
cdef void fin_database(wiser_env *env):
    sqlite3_finalize(env.get_document_id_st)
    sqlite3_finalize(env.get_document_title_st)
    sqlite3_finalize(env.insert_document_st)
    sqlite3_finalize(env.update_document_st)
    sqlite3_finalize(env.get_token_id_st)
    sqlite3_finalize(env.get_token_st)
    sqlite3_finalize(env.store_token_st)
    sqlite3_finalize(env.get_postings_st)
    sqlite3_finalize(env.update_postings_st)
    sqlite3_finalize(env.get_settings_st)
    sqlite3_finalize(env.replace_settings_st)
    sqlite3_finalize(env.get_document_count_st)
    sqlite3_finalize(env.begin_st)
    sqlite3_finalize(env.commit_st)
    sqlite3_finalize(env.rollback_st)
    sqlite3_close(env.db)

# Translate it from wiser/database.c
cdef int db_get_document_id(const wiser_env *env,
                            const char *title, unsigned int title_size):
    cdef int rc
    sqlite3_reset(env.get_document_id_st)
    # sqlite3_bind_text(env.get_document_id_st, 1,
    #                   title, title_size, SQLITE_STATIC)
    sqlite3_bind_text(env.get_document_id_st, 1,
                      title, title_size, NULL)
    rc = sqlite3_step(env.get_document_id_st)
    if rc == SQLITE_ROW:
        return sqlite3_column_int(env.get_document_id_st, 0)
    else:
        return 0