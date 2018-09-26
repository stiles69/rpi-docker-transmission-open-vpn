#!/bin/bash 
#===============================================================================
#
#          FILE: Automation_Custom_Script.sh
# 
#         USAGE: ./Automation_Custom_Script.sh
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/15/2018 10:04
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function Main ()
{
	echo "Setting up Hosts file."
    export MYTEMP="$(mktemp -d /tmp/XXXXXXXX)"
    touch $MYTEMP/hosts
    MYHOST="$MYTEMP/hosts"
    echo "# Static table lookup for hostnames." > $MYHOST
    echo "# See hosts(5) for details." >> $MYHOST
    echo "127.0.0.1	localhost" >> $MYHOST
    echo "127.0.1.1 manjaro.roguedesigns.us		manjaro" >> $MYHOST
    echo "10.0.0.5	dietpi.roguedesigns.us		slave1" >> $MYHOST
    echo "10.0.0.6 	slave2.roguedesigns.us		slave2" >> $MYHOST
    echo "10.0.0.11	manjaro.roguedesigns.us		manjaro" >> $MYHOST
    echo "10.0.0.12	slave3.roguedesigns.us		slave3" >> $MYHOST
    echo "10.0.0.14	master.roguedesigns.us		master" >> $MYHOST
    echo "::1	localhost ip6-localhost ip6-loopback" >> $MYHOST
    echo "ff02::1 ip6-allnodes" >> $MYHOST
    echo "ff02::2 ip6-allrouters" >> $MYHOST

    cp $MYHOST /etc/hosts

    echo "Finished hosts file"
    echo "$(cat /etc/hosts)"



}	# end Main

Main

#===EXIT===
exit 0

