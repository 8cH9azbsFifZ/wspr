#!/bin/sh
#autoscan -> configure.ac
git add .
git commit -a -m autogen.sh
aclocal && automake && autoconf && autoheader && ./configure
#cat Makefile | grep -v AC_CONFIG_MACRO_DIR > 1 && mv 1 Makefile
#make -j4
#make install
#test -e /usr/local//lib/python2.6/dist-packages/WsprMod/w.so || echo w.so not there
dpgk-buildpackage
