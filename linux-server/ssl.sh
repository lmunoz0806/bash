#! /bin/bash
# Renew SSL Certs
# Run script on terminal: bash ssl.sh domain certfile keyfile bundlefile
# You need to update /etc/apache2/sites-available/ssldefault file and point ssl files to new location 
# Server Specific Confiurations
# Default SSL Directory
SSL="/etc/apache2/ssl"
SSLFILES="/home/ubuntu"
# Server Specific Confiurations

# ARGUMENTS
DOMAIN=$1
CERT=$2
KEY=$3
BUNDLE=$4
# SSL Files
DIR="$SSLFILES/$DOMAIN"
NEWCERT="$DIR/$CERT"
NEWKEY="$DIR/$KEY"
NEWBUNDLE="$DIR/$BUNDLE"
OLDDIR="$SSL/old"

# Check if domain folder exists
if [ -d "$DOMAIN" ]; then
  echo -e "$DOMAIN exists."
  if [ -d "$OLDDIR" ]; then
    mv $SSL/$DOMAIN/* $OLDDIR
  else
    sudo mkdir $OLDDIR
ls
  fi
  mv $NEWCERT $NEWKEY $NEWBUNDLE "$SSL/$DOMAIN"
else
  sudo mkdir $DOMAIN
  mv $NEWCERT $NEWKEY $NEWBUNDLE "$SSL/$DOMAIN"
fi
echo "Done."
