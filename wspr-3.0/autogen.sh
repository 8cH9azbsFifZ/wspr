#!/bin/sh
git add .
git commit -a -m autogen.sh
aclocal && automake && autoconf && ./configure
