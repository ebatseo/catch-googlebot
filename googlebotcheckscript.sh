#!/bin/bash

####################################################
#
# Has Googlebot Visited You Yesterday?
#
# Main Script - Editing in here will break stuff ;)
#
####################################################

####################################################
#
#  This is a very inefficient script but that is by design.
#  I want all the data from each command to be stored
#  in text files for you to look at so you can understand
#  what happens.
#
# Once you have this working, why don't you try to improve it? :)
#
#  This Script is part of the technical SEO training from
#  https://the.domain.name
#  and copyright is reserved and owned by ForeverUn Limited.
#
#  This script is licensed under the Creative Commons
#  Attribution-ShareAlike 4.0 International
#
#  https://creativecommons.org/licenses/by-sa/4.0/
#
#  Link: Googlebot Analysis Shell Script - https://the.domain.name/
#
####################################################



# Editing anything in here will likely break stuff.
# That is fine, but make it work and make it better :)


# variables script - please edit the variables
# in the variables.sh script 

source variables.sh




#
# And here are the commands
#
# If you edit anything under here be careful.
#

# Extract visits with user agent of Googlebot
grep "Googlebot" $logpath$logfile > $gbot

# Extract IP addresses
grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' $gbot > $gbotips


#Just get the IPs of bots visited yesterday, as we'll be aiming to run this at a minute past Midnight

grep $date $gbotips > $yesterdaygbot

#Grep out corresponding log file entries for inclusion as an attachment

grep $date $gbot > $yesterdaygbotlog


#
#
# Loop through each line and run the host command to get the PTR of the IP address
# Then check the PTR to the IP and IP to PTR
# Do you know what the cut command does? If not, go and find out
# Do you know what the | does? It's a pipe...
#
#


cat $yesterdaygbot |while IFS= read -r gbotip
do

hostname=`host $gbotip | cut -f5 -d" "`
reverse=`host $hostname | cut -f4 -d" "`

        if [[ $hostname =~ \.googlebot\.com\.$ ]] && [[ $reverse =~ ^$gbotip$ ]]; then
                echo "Visited by Googlebot from $gbotip"
        else
                echo "Visited by fake Googlebot $gbotip"
        fi
done


exit
