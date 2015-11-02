cdef inline get_version():
  version = "0.0.1"
  return version

cdef inline version_info_from_version(s):
  import string
  return tuple([int(x) for x in string.split(s, ".")])

cdef _C_VERSION = get_version()
cdef _C_SQLITE_VERSION = SQLITE_VERSION
cdef _C_SQLITE_VERSION_NUMBER = SQLITE_VERSION_NUMBER

sqlite_version = _C_SQLITE_VERSION
sqlite_version_info = version_info_from_version(sqlite_version)
version = _C_VERSION
version_info = version_info_from_version(version)
