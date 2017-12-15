#!/bin/sh
# ======================================================================
# Script for generating a GMR dump deliverable for IARPA from the
# mysql database.  It should be run with a single parameter consisting
# of a datestamp, e.g.
#
# ./creategmrdump.sh 20130321
#
# It will read the data from a database in MySQL named icsi_gmr_DSTAMP
# and produce a dump of a database named icsi_DSTAMP (as per IARPAs
# spec).
#
# -jhong
#
# ======================================================================

umask 0002

export PATH=/u/metanet/tools/mysql64/bin:$PATH

GMRVERSION="31"
GMRVERSIONDEC="3.1"

DSTAMP="$1"

# DBNAME - is the name of the db to set in the dump to IARPA
DBNAME="icsi_$DSTAMP"

# GMRDBNAME - is the name of the db in our mysql db
GMRDBNAME="icsi_gmr_$DSTAMP"

# create/re-create the database
echo "DROP DATABASE IF EXISTS $DBNAME; CREATE DATABASE $DBNAME CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql -u mnadmin
echo "GRANT ALL ON $DBNAME.* TO 'gmruser'@'localhost';" | mysql -u mnadmin mysql

# make a copy of the gmr database
mysqldump -u mnadmin $GMRDBNAME | mysql -u mnadmin $DBNAME

# undo changes we made to facilicate population (so the final output
# matches their initial spec exactly)
#cat unalter_gmr_$GMRVERSION.sql | mysql -u mnadmin $DBNAME
cat /u/metanet/repository/gmrdumps/unalter_gmr_$GMRVERSION.sql | mysql -u mnadmin $DBNAME

# create the dump for IARPA
# IARPA does NOT want CREATE DB or USE DB statements
echo "INSERT INTO admin VALUES ('ICSI',$GMRVERSIONDEC,'$DSTAMP',NULL);" | mysql -u mnadmin $DBNAME
mysqldump -u mnadmin $DBNAME | gzip > icsi_gmr_v${GMRVERSION}_${DSTAMP}.sql.gz
