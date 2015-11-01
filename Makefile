CC = gcc

cysqlite3:
	python setup.py build_ext -if

.PHONY: clean
clean:
	@rm -rf sqlite3.c sqlite3.so build
