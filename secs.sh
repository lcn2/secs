#!/bin/sh -
#
# secs - compute 'seconds since the epoch' by P1003.1 Posix/ISO standard method
#
# @(#) $Revision$
# @(#) $Id$
# @(#) $Source$
#
# Copyright (c) 1993 by Landon Curt Noll.  All Rights Reserved.
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby granted,
# provided that the above copyright, this permission notice and text
# this comment, and the disclaimer below appear in all of the following:
#
#       supporting documentation
#       source copies
#       source works derived from this source
#       binaries derived from this source or from derived source
#
# LANDON CURT NOLL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
# INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO
# EVENT SHALL LANDON CURT NOLL BE LIABLE FOR ANY SPECIAL, INDIRECT OR
# CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
# USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#
# This date system fails on Jan 19, 2038 if expr is limited to 31
# bit signed values, otherwise it failes on Jan 1, 2070.

# the date format to use
#
EP_FMT='X%S + \( X%M \* 60 \) + \( X%H \* 3600 \) + \( X%j \* 86400 \) + \( \( X%y - 70 \) \* 31536000 \) + \( \( \( X%y - 73 \) / 4 \) \* 86400 \)'

# print the seconds since the epoch
#
eval expr `TZ=UTC date "+$EP_FMT" | sed -e 's/X00* /0 /g' -e 's/X0*//g'`
