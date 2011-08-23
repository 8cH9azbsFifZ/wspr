# todo
# 2x build dir ??
# w.so?
# make install
# make uninstall

AC_PREREQ([2.67])
AC_INIT([wspr], [3.0], [BUG-REPORT-ADDRESS])
AC_CONFIG_SRCDIR([src/padevsub.c])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_AUX_DIR([build-aux])

AC_PREFIX_DEFAULT(/usr/local/)
AC_SUBST([AC_CONFIG_ARGS], [$ac_configure_args])

# Check build environment
AC_CANONICAL_BUILD
AC_CANONICAL_HOST
AC_CANONICAL_TARGET

# Init automake
AM_INIT_AUTOMAKE([-Wall foreign std-options 1.9.6])
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_F77
AC_PROG_FC([gfortran g77])
AC_PROG_INSTALL
AC_PROG_MAKE_SET
AC_ISC_POSIX
AC_C_INLINE
AC_PATH_PROG(RM, rm)
AC_PATH_PROG(CP, cp)
AC_PATH_PROG(MV, mv)
AC_PATH_PROG(LN, ln)
AC_PATH_PROG(SED, sed)
AC_PATH_PROG(AR, ar)
AC_PATH_PROG(LD, ld)
AC_PATH_PROG(TEST, [test], [test])
AC_PATH_PROG(PYTHON, python)
AC_PATH_PROG(F2PY, f2py)
AC_SUBST(VERSION, "${version}")
AC_MSG_CHECKING([OS])
OS=`uname`
AC_SUBST(OS, "${OS}")


# Checks for libraries.
# FIXME: Replace `main' with a function in `-lfftw3f':
AC_CHECK_LIB([fftw3f], [main])
# FIXME: Replace `main' with a function in `-lportaudio':
AC_CHECK_LIB([portaudio], [main])
# FIXME: Replace `main' with a function in `-lsamplerate':
AC_CHECK_LIB([samplerate], [main])

# Checks for header files.
AC_HEADER_STDC
AC_HEADER_DIRENT
AC_HEADER_TIME
AC_CHECK_HEADER([samplerate.h], [HAS_SAMPLERATE_H=1], [HAS_SAMPLERATE_H=0])
AC_CHECK_HEADERS([pthread.h windows.h stdio.h stdarg.h fcntl.h inttypes.h limits.h stddef.h stdint.h stdlib.h string.h sys/ioctl.h sys/param.h sys/time.h time.h unistd.h sys/resource.h linux/ppdev.h dev/ppbus/ppi.h sys/stat.h sys/ioctl.h termios.h sys/wait.h wait.h libgen.h sys/syslog.h errno.h sys/resource.h inttypes.h linux/parport.h dev/ppbus/ppbconf.h])

# Dirty hack FIXME
CPPFLAGS="-I../ -I/usr/local/include ${CPPFLAGS}"
CFLAGS="-I../ -I/usr/local/include ${CFLAGS}"
LDFLAGS="-L/usr/local/lib ${LDFLAGS}"
LIBS=" -lpthread ${LIBS}"
FFLAGS_GFORTRAN="${FFLAGS} -fno-range-check -ffixed-line-length-none\
                        -Wall -fbounds-check -fno-second-underscore -fPIC"
FFLAGS_G95="${FFLAGS} -Wall -Wno-precision-loss -fbounds-check -fno-second-underscore -fPIC"
#-Wall -Wno-precision-loss -fbounds-check -fno-second-underscore -fPIC


# Checks for typedefs, structures, and compiler characteristics.
AC_TYPE_INT16_T
AC_TYPE_INT32_T
AC_TYPE_INT64_T
AC_TYPE_INT8_T
AC_TYPE_PID_T
AC_TYPE_SIZE_T
AC_TYPE_UINT16_T
AC_TYPE_UINT32_T
AC_TYPE_UINT64_T
AC_TYPE_UINT8_T

if test "x$prefix" = "xNONE" ; then
  prefix="/usr/local"
fi
if test "x$exec_prefix" = "xNONE" ; then
  exec_prefix=$prefix
fi
PREFIX=$prefix
AC_SUBST(PREFIX)
AC_SUBST(CPPFLAGS)
AC_SUBST(LDFLAGS)
AC_SUBST(LIBS)
AC_SUBST(CFLAGS)
AC_SUBST(FFLAGS)

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([gettimeofday strchr])

AC_CONFIG_FILES([Makefile src/Makefile])
AC_CONFIG_FILES([src/setup.py], [chmod +x src/setup.py])

AC_OUTPUT
