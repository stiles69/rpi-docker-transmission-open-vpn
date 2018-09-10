#!/bin/bash
#===============================================================================
#
#          FILE:  Encrypt-Dir-GPG.sh
# 
#         USAGE:  ./Encrypt-Dir-GPG.sh 
# 
#   DESCRIPTION:  Encrypts the whole directory with GPG.
# 
#       OPTIONS:  
#  REQUIREMENTS:  GPG
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  03/03/2018 09:42:28 PM CST
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

function get_passphrase ()
{
read -rsp "Enter passphrase: " PASSPHRASE
}    # ----------  end of function get_passphrase  ----------

function get_user_name ()
{
read -p 'What key do you want to use. (email address):' KEY

}    # ----------  end of function get_user_name  ----------
get_user_name
get_passphrase
for FILE in *.*;
do 
	echo "Encrypting" $FILE "to" "{$FILE.gpg}"
	echo "$PASSPHRASE" | gpg -se -r $KEY $FILE
done
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

