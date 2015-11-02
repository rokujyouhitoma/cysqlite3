import string

_C_SQLITE_VERSION = SQLITE_VERSION
_C_SQLITE_VERSION_NUMBER = SQLITE_VERSION_NUMBER

cdef version_info_from_version(s):
  return tuple([int(x) for x in string.split(s, ".")])

version = "0.0.1"
version_info = version_info_from_version(version)

sqlite_version = _C_SQLITE_VERSION
sqlite_version_info = version_info_from_version(sqlite_version)
