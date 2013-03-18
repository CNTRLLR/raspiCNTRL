#!/bin/bash 
#
# This script updates and configures the raspberry pi OS and installs required packages and dependencies
#
clear
sudo -i

# First, update the OS
apt-get -y update; apt-get -y dist-upgrade 

# Install vsftpd FTP Server
apt-get -y install vsftpd

# Install libnss-mdns. This is used for multicast DNS services
apt-get -y install libnss-mdns

# Install Node.js
apt-get -y install nodejs

# Install libcap2 binaries. This package allows running apps on low ports without requiring root.
apt-get -y install libcap2-bin
# Configures node for low port access. This must run after node has been installed.
setcap cap_net_bind_service=+ep /usr/bin/nodejs

# Install git
apt-get -y install git

# Clone SYSTM github repo
git clone git://github.com/CNTRLLR/SYSTM.git /opt/CNTRLLR

# Run node setup script
./node-setup.sh