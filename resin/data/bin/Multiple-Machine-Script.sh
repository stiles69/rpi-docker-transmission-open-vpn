#!/bin/bash
USERNAME=brettsalemink
HOSTS="192.168.1.4"
SCRIPT="~/BashScripts/Multiple_Script_Folder/; ls"
for HOSTNAME in ${HOSTS} ; do
    ssh -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
done
