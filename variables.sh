#!/bin/bash

####################################################
#
# Has Googlebot Visited You Yesterday?
#
# Variables Script - Edit in here
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


#
#  This is where you can edit variables
#  Please do so, or this won't work :)
#
#

#logfile to be analysed

logfile="access.log"
logpath="/var/log/"

# This is important. You need to make sure your date format matches your log file.
date=`date -d "yesterday" +"%d/%b/%Y"`

# Change these if you want the files to be called something different

#File to store Googlebot visits 
gbot="gbot.log"
#File to store Googlebot Visit IP Addresses
gbotips="gbot.ips"
#File to store only Yesterday's Googlebot visit IP Addresses
yesterdaygbot="yesterday_gbot.ips"
#File to store only Yesterday's Googlebot visits
yesterdaygbotlog="yesterdaygbotlog.log"


#
# MailGun  Related Variables
#
# IMPORTANT - You MUST sign up to the Mailgun.com service
# When you do certain variables will be unique to you.
# You must fill that information in here
#
# Also, if you wish to email someone other than the primary account holder at MailGun
# You MUST add that as a recipient within the Mailgun System - https://mailgun.com/app/testing/recipients
#
# We have used MailGun for this script as it is free and reliable for the usage of this script.
# and although you may have Sendmail or other MTA installed on your server, you may not have it installed
# and this is easier than setting Sendmail up  :)
# It also shows another route to include features in Shell Scripts.


# Place your api key shown in the cURL example from sign up
mailgunapi="api:key-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#Place the Mailgun URL shown in the cURL example from sign up
mailgunapiurl="https://api.mailgun.net/v3/sandboxXXXXXXXXXXXXXXXXXXXXXXXX.mailgun.org/messages"
#Place the Mailgun from address shown in the cURL example from sign up
mailgunfrom="Mailgun Sandbox <postmaster@sandboxXXXXXXXXXXXXXXXXXXXXXXXX.mailgun.org>"


# Who do you want to be emailed?
#N.B. You will need to ensure this person has been added and verifed at https://mailgun.com/app/testing/recipients
email="You <Your@Email.Address>"
# This will be the body of the email and attachments will have full details
text="You received $gbcount verified GBot visits yesterday on your site from $gbuniqcount IP addresses."

#You probably want to leave these as is... But like all things in this... Play if you wish to

gbcount=`cat $yesterdaygbotlog | wc -l`
gbuniqcount=`cat $yesterdaygbot | uniq | wc -l`


