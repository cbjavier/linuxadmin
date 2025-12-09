#!/bin/sh
#Caleb Javier - 00252855
#This script will be used to create a network report to the command line as well as a log file where all network information and status reports will be on dislplay. 
echo "\n"
echo "Begin Network Report - `date`"
echo "\n"

echo "SECTION - NETWORK INFORMATION:"
echo "\n"
#Begin section one, where the user will learn about:

#The hostname, which will simply tell the user what their IP resolves to
echo "Information for hostame `hostname`"
echo "\n"

#the interfaces that exist on the system and their statuses, as well as their IP addresses
echo "Available interfaces and current IP addresses"
ip a show

#A list of all listening ports, which 
echo "\nListening Ports (Netstat)"
ss -t -r state established

#the routing table of the system, which directs outgoing traffic from the host
echo "\nRouting Table"
ip route list

#address resolution protocol pulls up ARP table for viewing which MAC addresses belong to IPs on the local network.
echo "\nARP Table"
arp -a

echo "\nSECTION - CONNECTIVITY\n"
#Begin section two, where the user can see the connection being tested with 

#Here is a custom ping test - the user can enter the address they would like to ping to get more specific results.

echo "Ping Test - Please enter an IP Address or hostname"
read pingrequest "Address/Host to ping:"
if [ -n "$pingrequest" ];
then
	echo "Pinging $pingrequest..."
	ping -c 4 "$pingrequest" || echo "Could not reach $pingrequest."

else 
	echo "Ping test failed, bad input detected."

fi

#nslookup - searches for the domain of an IP address, which tests for resolver issues
echo "\nNSLookup - IP Address 8.8.8.8"
nslookup 8.8.8.8

#traceroute - traces hops required for a packet to reach its destination, which is useful for noting the path its taking
echo "\nTraceroute - Tracing hops to www.google.com...."
traceroute google.com


