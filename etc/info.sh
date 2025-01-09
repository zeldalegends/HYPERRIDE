#!/bin/bash

echo -e "\033[1;32mSYSTEM INFORMATION \033[0m"
KERNEL=$(sudo cat /etc/issue)
echo ${KERNEL::-6}
# echo IP: $(curl -s http://whatismyip.akamai.com/)
# echo IP: $(curl -s https://ipv4.icanhazip.com/)
# echo IP: $(curl -s https://ifconfig.me/)
echo IP: $(ip addr show $(ip route | awk '/default/ { print $5 }') | grep 'inet' | head -n 1 | awk '/inet/ {print $2}' | cut -d'/' -f1)
uname -nrpv
echo
echo -e "\033[1;33mCPU \033[0m"
cat /proc/cpuinfo | grep -E -i -w 'name|cpu MHz'
echo
echo -e "\033[1;34mRAM\033[0m"
free -m
echo
echo -e "\033[1;35mDISKS \033[0m"
df -h
echo
read key
clear

echo -e "\033[1;36mDOCKER CONTAINERS \033[0m"
docker ps -a --format "table {{.Names}}\t{{.ID}}\t{{.Status}}\t{{.Ports}}\t{{.Image}}" | sort # LC_COLLATE=C sort
echo
echo -e "\033[1;30mPORTS \033[0m"
lsof -i -P -n | grep LISTEN # ss -tunlp
echo
echo -e "\033[1;33mCOMMANDS \033[0m"
echo -e "docker rm -f \$(docker ps -aq) \033[1;32m# Remove all Docker containers \033[0m"
echo
echo -e "CTRL+Z \033[1;32m# Put the running process in background \033[0m"
echo -e "jobs \033[1;32m# List the processes running in background \033[0m"
echo -e "fg \"%<n>\" \033[1;32m# Recall the <n>th process in background to foreground \033[0m"
echo
echo -e "sudo nc -l <port> \033[1;32m# Open a local socket on a specific port \033[0m"
echo -e "telnet <host> <post> \033[1;32m# Connect to a remote socket on a specific port \033[0m"
echo
echo -e "\033[1;34mUSERS \033[0m"
sudo cat /etc/passwd | grep 100 | grep -v 100:
echo
echo -e "\033[1;35mPROCESSES \033[0m"
ps acrux

read key
htop
