#!/bin/sh
#autoscan -> configure.ac
git add .
git commit -a -m autogen.sh
aclocal && automake && autoconf && autoheader && ./configure
cat Makefile | grep -v AC_CONFIG_MACRO_DIR > 1 && mv 1 Makefile
make
