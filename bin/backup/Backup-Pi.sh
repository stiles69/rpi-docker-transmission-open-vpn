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
#         NOTES:  
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/04/2017 04:02:50 PM CST
#      REVISION:  
#===============================================================================`
SRCDIR="/"
DESTDIR="/mnt/FreeAgent/Backups/Stretch/"
EXCLUDEFILENAME="/home/brettsalemink/.excludefile"
FILENAME=Stretch-Backup-$(date +%Y%m%d%T).tgz
FILEDATE=$(date +%Y%m%d%T)
PACKAGENAME="-package-selection"
PACKAGEFILENAME=$FILEDATE$PACKAGENAME


function create_package_list ()
{

dpkg --get-selections > $DESTDIR$PACKAGEFILENAME


}      # -------- end of function create_package_list -----------



function backup_home ()
{
	echo $FILENAME
	tar --create -X $EXCLUDEFILENAME --exclude-backups --exclude-vcs-ignores --verbose --gzip --file=$DESTDIR$FILENAME $SRCDIR
}    # ----------  end of function backup_home  ----------
function sync_antergos()
{
	rsync -rvz --progress --ignore-existing /mnt/FreeAgent/Backups/Stretch/ brettsalemink@antergos.roguedesigns.us:/mnt/Data/Backups/Stretch/
}

function sync_mega()
{
	mega-sync /mnt/FreeAgent/Backups/Stretch/ /Backups/Stretch/

}
function remove_local_backups ()
{

#echo "Not Removing Old Backups"

# sudo rm -r /mnt/FreeAgent/Backups/Stretch
# sudo mkdir /mnt/FreeAgent/Backups/Stretch

# sudo chown -R nfsusernobody:nfsgroupnone /mnt/FreeAgent/Backups/
# sudo chmod -R 774 /mnt/FreeAgent/Backups/ 

}  # -------- end function remove_local_backups -------


create_package_list
backup_home
sync_antergos
#sync_mega
#remove_local_backups
exit
