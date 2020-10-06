#! /bin/bash

# Create a user in Linux system and add pub key file for easy ssh access, if user exist it will only add the ssh key.
# How to run script in terminal: bash user.sh luis /home/ubuntu/luiskey.pub
#ARGUMENTS
#USER - USERNAME
#KEYFILE - location of file (/home/username/key.pub)
USERNAME=$1
KEYFILE=$2
#ARGUMENTS

#Default users directory
DIR="/home"

createUser() {
 sudo useradd -m $USERNAME
 #To add a password to account uncomment
 #passwd $USERNAME
}

deleteUser() {
 sudo userdel -r $USERNAME
}

createKeyDir() {
 sudo mkdir $DIR/$USERNAME/.ssh
 sudo touch $DIR/$USERNAME/.ssh/authorized_keys
}

addKey(){
 cat $KEYFILE >> $DIR/$USERNAME/.ssh/authorized_keys
}

if [ -d "$DIR/$USERNAME" ]; then
   echo "User exits, adding user's key"
   if [ -d "$DIR/$USERNAME/.ssh" ]; then
   addKey
   echo "Done"
   else
   createKeyDir
   addKey
   echo "Done!"
   fi
else
   echo "User doesn't exist, creating account"
   createUser
   createKeyDir
   addkey
   echo "User have been created!"
fi
