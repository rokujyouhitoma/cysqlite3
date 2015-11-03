from setuptools import setup, Extension
from Cython.Build import cythonize

sources = []

include_dirs = []

libraries = [
    'sqlite3'
]

DEBUG = True
if DEBUG:
    CFLAGS=["-Wall", "-std=c99", "-D_GNU_SOURCE", "-D_FILE_OFFSET_BITS=64", "-O3", "-g"]
else:
    CFLAGS=["-Wall", "-std=c99", "-D_GNU_SOURCE", "-D_FILE_OFFSET_BITS=64", "-O3", "-g"]

ext = Extension("sqlite3",
                sources=["sqlite3.pyx"] + sources,
                include_dirs=include_dirs,
                libraries=libraries,
                language="c",
                extra_compile_args=CFLAGS)

setup(name="sqlite3 wrapper used of Cython",
      ext_modules=cythonize([ext]),
      setup_requires=['Cython >= 0.23.4'],
      install_requires=['Cython >= 0.23.4'])
