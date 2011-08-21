#!/bin/sh
#autoscan -> configure.ac
# autoheader _> config.h.in
git add .
git commit -a -m autogen.sh
aclocal && automake && autoconf && ./configure
