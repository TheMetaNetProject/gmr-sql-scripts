#!/bin/sh

# reset_gmr.sh [gmr_db_name]
#
# Create a gmr database instance for ICSI internal use. If the database already exists,
# the script will drop it and create an empty one.  This database is almost identical
# to the structure that IARPA sends us, except some fields and indices have been added
# to speed up population of the database.  Those fields and indices as later removed
# prior to delivery to IARPA.
#
# -jhong
# 5/12 SJD: added grants
# 9/11/14 SJD:  added FILE grant
# 10/18/14 SJD: v44

export PATH=/u/metanet/tools/mysql64/bin:$PATH

# PARAMETER PROCESSING
# default gmr database name is icsi_gmr_YYYYMMDD
if [[ -z $1 ]]
then
dstamp=`date +%Y%m%d`
GMRDBNAME="icsi_gmr_$dstamp"
else
GMRDBNAME="$1"
fi

# CONSTANTS
GMRDUMPDIR=/u/metanet/repository/gmrdumps
IARPAGMRDUMP=${GMRDUMPDIR}/gmr_44_Dump20141010.sql
ALTERGMRFILE=${GMRDUMPDIR}/alter_gmr_44.sql

echo "resetting database $GMRDBNAME..."
echo "DROP DATABASE IF EXISTS $GMRDBNAME; CREATE DATABASE $GMRDBNAME CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql -u mnadmin
cat $IARPAGMRDUMP | mysql -u mnadmin $GMRDBNAME
cat $ALTERGMRFILE | mysql -u mnadmin $GMRDBNAME
echo "GRANT ALL ON ${GMRDBNAME}.* TO 'gmruser'@'localhost';" | mysql -u mnadmin mysql
echo "GRANT FILE ON *.* TO 'gmruser'@'localhost';" | mysql -u mnadmin mysql
