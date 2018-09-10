#!/bin/bash
#===============================================================================
#
#          FILE:  Change-Mnt-Temp-Permissions.sh
# 
#         USAGE:  ./Change-Mnt-Temp-Permissions.sh 
# 
#   DESCRIPTION:  Changes the folder permissions to owner brettsalemink:users 774.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  02/15/2018 07:00:54 PM CST
#      REVISION:  1.0
#===============================================================================

set -o nounset                                  # treat unset variables as errors

#===============================================================================
#   GLOBAL DECLARATIONS
#===============================================================================
declare -rx SCRIPT=${0##*/}                     # the name of this script
declare -rx mkdir='/bin/mkdir'                  # the mkdir(1) command

#===============================================================================
#   SANITY CHECKS
#===============================================================================
if [ -z "$BASH" ] ; then
printf "$SCRIPT:$LINENO: run this script with the BASH shell\n" >&2
exit 192
fi

if [ ! -x "$mkdir" ] ; then
printf "$SCRIPT:$LINENO: command '$mkdir' not available - aborting\n" >&2
exit 192
fi

#===============================================================================
#   MAIN SCRIPT
#===============================================================================
#--------------------------Setup Paths--------------------------
FOLDERPATH=/mnt/Temp
function change_owner ()
{
chown -R brettsalemink:users $FOLDERPATH
wait
echo 'Owner changed.'
}    # ----------  end of function change_owner  ----------


function change_permissions ()
{
chmod -R 774 $FOLDERPATH
wait
echo 'Permissions changed.'
}    # ----------  end of function change_permissions  ----------


#################################
#  Main Script Logic Start Here #
#################################
case $1 in
	owner)
		change_owner
		;;
	file_permissions)
		change_permissions
		;;
	both)
		change_owner
		change_permissions
		;;
*)
	echo "Usage: $0 {owner|filepermissions|both}"
	echo ""
	echo "Use this shell script to change owner and or permissions on /mnt/Temp."
esac
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0
