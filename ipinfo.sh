echo "Begin Network Info Dump for $(date)"
echo "Network Interfaces"


ip a
#Provides a newline to make for a neater appearance.
echo -e "\n"


#Packets transmitted/received

echo "Packed Transmitted and Received"
ip -s link
echo -e "\n"


#Routing table information

echo "Routing Table Information"
ip route | awk '{print "Route Entry: " $0}'
echo -e "\n"

#DNS config
echo "DNS Configuration"
cat /etc/resolv.conf | grep -A 8 '^nameserver'
echo -e "\n"

#All actively open ports

echo "Open Ports"
sudo netstat -ntlp | grep LISTEN
echo -e "\n"
