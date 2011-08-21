#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

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
AC_PROG_INSTALL

# Checks for libraries.
# FIXME: Replace `main' with a function in `-lfftw3f':
AC_CHECK_LIB([fftw3f], [main])
# FIXME: Replace `main' with a function in `-lportaudio':
AC_CHECK_LIB([portaudio], [main])
# FIXME: Replace `main' with a function in `-lsamplerate':
AC_CHECK_LIB([samplerate], [main])

# Checks for header files.
AC_CHECK_HEADERS([fcntl.h inttypes.h limits.h stddef.h stdint.h stdlib.h string.h sys/ioctl.h sys/param.h sys/time.h unistd.h])

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

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([gettimeofday strchr])

AC_CONFIG_FILES([Makefile
                 src/Makefile])
AC_OUTPUT
