#!/bin/bash  
#===============================================================================
#
#          FILE: Set-MOTD.sh
# 
#         USAGE: ./Set-MOTD.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/18/2018 17:16
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
. $HOME/lib/sh/funcDisplayHostname.sh

echo "What do you want for a contact name?"
read CONTACTNAME
echo "What is your contact email address?"
read CONTACTEMAIL
HOSTER="$(DisplayHostname)"

echo "========================================================" > /tmp/Motd
echo "                      Welcome to Linux" >> /tmp/Motd
echo "Custom Linux Install by $CONTACTNAME <$CONTACTEMAIL>." >> /tmp/Motd
echo "========================================================" >> /tmp/Motd
echo "                   Rogue Designs $HOSTER" >> /tmp/Motd
echo "========================================================" >> /tmp/Motd

sudo cp /tmp/Motd /etc/motd
