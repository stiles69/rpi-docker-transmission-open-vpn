#!/bin/bash
#===============================================================================
#
#          FILE:  Backup-Home.sh
# 
#         USAGE:  ./Backup-Home.sh 
# 
#   DESCRIPTION:  Backups home directory to Backups.
# 
#       OPTIONS:  None
#  REQUIREMENTS:  None
#          BUGS:  None
#         NOTES:  To install packages from the list backup run pacman -S --needed - < pkglist.txt 
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/04/2017 04:02:50 PM CST
#      REVISION:  
#===============================================================================`
SRCDIR="/home/brettsalemink/"
DESTDIR="/mnt/Data/Backups/Antergos/"
EXCLUDEFILENAME="/home/brettsalemink/.excludefile"
FILENAME=Home-Backup-$(date +%Y%m%d%T).tgz
FILEDATE=$(date +%Y%m%d%T)


function create_package_list ()
{
# This will create a list of all explicity installed packages
pacman -Qqe > /mnt/Data/Backups/Antergos/$FILEDATE-pkglist.txt
}    # ----------  end of function create_package_list  ----------

function create_globally_installed_node_list ()
{
# This funtion will create a list of global node packages
npm list -g --depth=0 > /mnt/Data/Backups/Antergos/$FILEDATE-Node_List.txt
}  # --------- end of fuction --------

function backup_home ()
{
	echo $FILENAME
	tar --create -X $EXCLUDEFILENAME --exclude-backups --exclude-vcs-ignores --verbose --gzip --file=$DESTDIR$FILENAME $SRCDIR
}    # ----------  end of function backup_home  ----------
create_package_list
create_globally_installed_node_list
backup_home
exit
