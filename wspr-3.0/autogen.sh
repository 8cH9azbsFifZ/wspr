#!/bin/sh
#autoscan -> configure.ac
# autoheader _> config.h.in
git add .
git commit -a -m autogen.sh
aclocal && automake && autoconf && ./configure
cat Makefile | grep -v AC_CONFIG_MACRO_DIR > 1 && mv 1 Makefile
make
