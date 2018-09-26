#!/bin/bash
#===============================================================================
#
#          FILE:  Seed-File.sh
# 
#         USAGE:  ./Seed-File.sh 
# 
#   DESCRIPTION:  This will seed a torrent file
#									with transmission.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/09/2017 03:06:40 PM CST
#      REVISION:  ---
#===============================================================================
#!/bin/bash

TRANSDIR=/home/brettsalemink/Downloads

rsync -avzh --ignore-existing --progress /mnt/Media/Torrents/ /home/brettsalemink/Downloads/Torrents

#cp -p -v $1 $TRANSDIR/Torrents/

transmission-create $TRANSDIR/Torrents/$1 -t udp://tracker.openbittorrent.com:80 -o $HOME/$1.torrent

#transmission-cli --new $TRANSDIR/Torrents/$1

transmission-remote --add $HOME/$1.torrent


