#!/bin/bash
#===============================================================================
#
#          FILE:  Set-Default-Permissions.sh
# 
#         USAGE:  ./Set-Default-Permissions.sh 
# 
#   DESCRIPTION:  This will set the Home Directory, .ssh, and .gnupg Directories to the correct permissions.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  04/01/2018 06:12:36 AM CDT
#      REVISION:  ---
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

function set_home_permissions ()
{
sudo find ~ -type d -exec chmod 755 {} +
}    # ----------  end of function set_home_permissions  ----------


function set_.ssh_permissions ()
{
sudo find ~/.ssh/ -type d -exec chmod 700 {} +

sudo chmod 644 ~/.ssh/id_rsa.pub
sudo chmod 600 ~/.ssh/id_rsa
}    # ----------  end of function set_.ssh_permissions  ----------


function set_.gnupg_permissions ()
{
sudo chmod 600 ~/.gnupg/*
sudo chmod 700 ~/.gnupg
}    # ----------  end of function set_.gnupg_permissions  ----------

set_home_permissions
wait
set_.ssh_permissions
wait
set_.gnupg_permissions
wait
echo 'All Done!'

#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

