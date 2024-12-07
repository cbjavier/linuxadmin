#!/bin/bash

#Deny al incoming packets
sudo iptables -A INPUT -p tcp --dport 22 -j DROP

#Deny all outgoing packets
sudo iptables -A OUTPUT -p tcp --dport 22 -j DROP

#Review settings changes
sudo iptables-save
