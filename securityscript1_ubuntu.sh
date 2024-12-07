#!/bin/bash

#variables


fail_count = 5
sus_hours = "00:00-06:00"
sus_user = "root"

#today's date in simplified format (Dec 06)
newdate = $(date +"%b %d")

#Detect failed login attempts exceeding suspicious limit
echo "Checking for failed login attempts..."
grep "$newdate" /var/log/auth.log | grep "Failed password" | awk '{print $11}' | sort | uniq -c | awk -v limit="$fail_count" '$1 >= limit {print "ALERT: " $1 " failed login attempts from IP " $2}'

#detect logins during suspicious hours (between 00:00 and 06:00)
echo "Checking for logins during suspicious hours..."
grep "$newdate" /var/log/auth.log | grep "Accepted password" | awk '{split($3, time_parts, ":"); if (time_parts[1] + 0 < 6) print "ALERT: Login during suspicious hours (" $3 ") by user " $9 " from IP " $11}'

#Detect logins by the suspicious user (root)
echo "Checking for logins by suspicious user ($sus_user)..."
grep "$newdate" /var/log/auth.log | grep "Accepted password" | grep " $sus_user " | awk '{print "ALERT: Login by " $9 " at " $3 " from IP " $11}'