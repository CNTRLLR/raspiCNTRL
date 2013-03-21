raspiCNTRL
=======

SYSTM build for Raspberry pi.

<h3>IMAGES</h3>
Contains Raspberry pi IMG files ready to flash and boot.

<h3>SCRIPTS</h3>
These scripts will install all necessary Debian OS packages and Node NPM modules to run SYSTM.

<h3>TOOLS</h3>
Contains utilities for flashing IMG files, etc.

<h1>Getting Started</h1>

Flash an image to an SD Card. In Windows you can use Win32diskimager to do this. Load the SD card into the rpi and you're ready to go.

<h4>Install from CNTRLLR IMG:</h4>

<ul>
<li>Login to the rpi using <i>pi:raspberry</i></li>

<li>
Update the Operating System
<br/>
<code>sudo apt-get -y update; apt-get -y dist-upgrade</code></li>
<li>
Update mirrors
<br/>
<code>sudo apt-get -y update --fix-missing</code>
</li>
<li>
Update SYSTM repo.
<br/>
<code>cd /opt/cntrllr;git pull</code>
</li>
<li>
Run the build script to update all packages and software
<br/>
<code>sudo /opt/cntrllr/build/pi-setup.sh</code>
</li>
</ul>
<h4>Install from scratch:</h4>
<ul>
<li>
Load a raspberry pi linux image. You can use a minimal one from the images folder or use an <a href="http://www.raspberrypi.org/downloads">official one</a>. 
</li>
<li>
Login to the rpi using the default credentials. For official Wheezy builds it is <i>pi:raspberry</i>
</li>
<li>
First thing we will do to speed things up is to allocate maximum memory to CPU.
<br/>
<code>sudo cp /boot/arm224_start.elf /boot/start.elf</code>
</li>
<li>
Update the Operating System
<br/>
<code>sudo apt-get -y update; sudo apt-get -y dist-upgrade</code>
</li>
<li>
Update mirrors
<br/>
<code>sudo apt-get -y update --fix-missing</code>
</li>
<li>
Install various OS utilities
<br/>
<code>sudo apt-get -y install g++ make libssl-dev python ca-certificates</code>
</li>
<li>
Install libnss-mdns. This is used for multicast DNS services
<br/>
<code>sudo apt-get -y install libnss-mdns</code>
</li>
<li>
Install vsftpd FTP Server
<br/>
<code>sudo apt-get -y install vsftpd</code>
</li>
<li>
Install git.
<br/>
<code>sudo apt-get install git git-core</code>
</li>
<li>
Install and compile Node.js manually because package is out of date
<br/>
<code>
cd ~<br/>
wget http://nodejs.org/dist/v0.10.0/node-v0.10.0.tar.gz<br/>
tar -zxf node-v0.10.0.tar.gz<br/>
cd node-v0.10.0<br/>
./configure<br/>
make<br/>
sudo make install<br/>
</code>
</li>
<li>
Install gpio-admin. Allows you to use gpio without root
<br/>
<code>
cd ~<br/>
git clone git://github.com/quick2wire/quick2wire-gpio-admin.git<br/>
cd quick2wire-gpio-admin<br/>
make<br/>
sudo make install<br/>
sudo adduser $USER gpio<br/>
</li>
<li>
Install libcap2 binaries. This package allows running apps on low ports without requiring root.
<br/>
<code>sudo apt-get -y install libcap2-bin</code>
</li>
<li>
Configures node for low port access. This must run after node has been installed.
<br/>
<code>sudo setcap cap_net_bind_service=+ep /usr/local/bin/node</code>
</li>
<!--
<li>
Get rpi-update via https://github.com/Hexxeh/rpi-update
<br/>
<code>sudo wget http://goo.gl/1BOfJ -O /usr/bin/rpi-update && sudo chmod +x /usr/bin/rpi-update && sudo rpi-update</code>
</li>
-->
<li>
Clone the SYSTM repo
<br/>
<code>sudo git clone git://github.com/CNTRLLR/SYSTM.git /opt/cntrllr</code>
</li>
<li>
Make the helper scripts executable
<br/>
<code>sudo chmod u+x /opt/cntrllr/build/*.sh</code>
</li>
<li>
Now run the script to update the OS and software.
<br/>
<code>sudo /opt/cntrllr/build/pi-setup.sh</code>
</li>
</ul>
