SYSTM-pi
=======

SYSTM images and build scripts for Raspberry pi.

<h3>IMAGES</h3>
Contains Raspberry pi IMG files ready to flash and boot.

<h3>SCRIPTS</h3>
These scripts will install all necessary Debian OS packages and Node NPM modules to run SYSTM.

<h3>TOOLS</h3>
Contains utilities for flashing IMG files, etc.

<h1>Getting Started</h1>

Flash an image to an SD Card. In Windows you can use Win32diskimager to do this. Load the SD card into the rpi and you're ready to go.

<h4>Install from CNTRLLR IMG:</h4>
Login to the rpi
First, update SYSTM repo and associated build scripts.

<code>cd /opt/cntrllr;git pull</code>

Run the build script to update all packages and software

<code>sudo /opt/cntrllr/build/pi-setup.sh</code>

<h4>Install from scratch:</h4>
Load a raspberry pi linux image. You can use a minimal one from the images folder or use an <a href="http://www.raspberrypi.org/downloads">official one</a>. 

Login to the rpi using the default credentials. For official Wheezy builds it is <i>pi:raspberry</i>

First thing we will do to speed things up is to allocate maximum memory to CPU.

<code>sudo cp /boot/arm224_start.elf /boot/start.elf</code>

Update the Operating System

<code>apt-get -y update; apt-get -y dist-upgrade</code>

Update mirrors

<code>sudo apt-get -y update --fix-missing</code>

Install various OS utilities

<code>sudo apt-get -y install g++ make libssl-dev</code>

Install libnss-mdns. This is used for multicast DNS services

<code>sudo apt-get -y install libnss-mdns</code>

Install vsftpd FTP Server

<code>sudo apt-get -y install vsftpd</code>

Install git.

<code>sudo apt-get install git</code>

Install and compile Node.js manually because package is out of date

<code>
cd ~<br/>
wget http://nodejs.org/dist/v0.10.0/node-v0.10.0-linux-arm-pi.tar.gz<br/>
tar -zxf node-v0.10.0-linux-arm-pi.tar.gz<br/>
cd node-v0.10.0-linux-arm-pi<br/>
./configure<br/>
make<br/>
sudo make install<br/>
</code>

Install libcap2 binaries. This package allows running apps on low ports without requiring root.

<code>sudo apt-get -y install libcap2-bin</code>

Configures node for low port access. This must run after node has been installed.

<code>sudo setcap cap_net_bind_service=+ep /usr/local/bin/node</code>

Clone the SYSTM repo

<code>git clone git://github.com/CNTRLLR/SYSTM.git /opt/cntrllr</code>

Make the helper scripts executable

<code>chmod u+x /opt/cntrllr/build/*.sh</code>

Now run the script to update the OS and software.

<code>sudo /opt/cntrllr/build/pi-setup.sh</code>
