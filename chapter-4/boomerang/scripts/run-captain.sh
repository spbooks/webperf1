#!/bin/bash
# RUM TESTING WITH BOOMERANG (http://yahoo.github.com/boomerang)
# using a beacon.gif from GET Apache Access Files
# collecting and exporting it into csv file


CURR_DATE=$(date +'%m-%d-%Y-%H-%M-%S')
FILEFORMAT=$(date +"2013-%m-%d")
LOGFILE="$CURR_DATE.log"
CSVFILE="$CURR_DATE.csv"
RUMDIRECTORY="/path-to/captain-rum"
LOGPATTERN="*-access_log.gz"
PATHTOAPACHE="path-to-apache-files"
echo "------------------------------"
echo "STARTING CAPTAIN RUM test for $CURR_DATE"
echo "------------------------------"
echo "zgrep beacon.gif and logging into $LOGFILE"
zgrep beacon.gif $PATHTOAPACHE/$LOGPATTERN >$RUMDIRECTORY/logs/$LOGFILE
echo "zgrep done..."
echo "running perl script now to convert $LOGFILE into $CSVFILE"
perl $RUMDIRECTORY/scripts/run-captain.pl $RUMDIRECTORY/logs/$LOGFILE >$RUMDIRECTORY/csv/$CSVFILE
echo "all done...."
echo ""