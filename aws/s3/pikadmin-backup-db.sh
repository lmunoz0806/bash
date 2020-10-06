#! /bin/bash
echo run as postgres user
#<--------PARAMS------------->
SOURCEDIR="/vol1/backup/pg_dumps/"
#DB="atpoc"
S3="s3://atpoc-dbsnapshots/pik-admin/pg_dumps/"
DATE=`date +%Y-%m-%d`
FILENAME=$DB-$DATE-$(date +%-T)_pg_bck.gz
#<--------PARAMS------------->
#delete old backups
echo `date` - Delete old backups
find $SOURCEDIR/* -mtime +5 -print -delete

#Backup single database
echo `date` - Backing up database
# add -v for verbose mode
#pg_dump -Fc -v $DB | gzip > $SOURCEDIR$FILENAME

#Backup all databases gzip
pg_dumpall -v | gzip> $SOURCEDIR$FILENAME

#Backup to s3 bucket
echo `date` - Backing up pg_dumps to s3
aws s3 sync $SOURCEDIR $S3
echo `date` - backup complete!
