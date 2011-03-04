#!/bin/ksh -p
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2010, 2011 Joyent, Inc.  All rights reserved.
# Use is subject to license terms.
#

unset LD_LIBRARY_PATH
PATH=/usr/bin:/usr/sbin
export PATH

if [[ -n $_ZONEADMD_brand_debug ]]; then
	logfile=/var/log/zone_bh.$1
	date >>$logfile
	echo "zone $1 pre-state-change $3 $4" >>$logfile
	ksh -x /usr/lib/brand/joyent/statechange "pre" $1 $2 $3 $4 \
	    >>$logfile 2>&1
	res=$?
	echo "zone $1 pre-state-change result $?" >>$logfile
else
	/usr/lib/brand/joyent/statechange "pre" $1 $2 $3 $4
	res=$?
fi

exit $res
