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

Flash one of the IMG files to an SD Card. In Windows you can use Win32diskimager.

<h4>Install from CNTRLLR IMG:</h4>
Login to the rpi
First, update SYSTM repo and associated build scripts.

<code>cd /opt/cntrllr;git pull</code>

Run the build script to update all packages and software

<code>sudo /opt/cntrllr/build/pi-setup.sh</code>

<h4>Install from scratch:</h4>
Login to the rpi using root:raspi
First thing to do is to clone the SYSTM repo which contains useful build scripts to automate much of the configuration process. Run the following command to install git:

<code>sudo apt-get install git</code>

Then clone the repo. Make sure you use the directory specified:

<code>git clone git://github.com/CNTRLLR/SYSTM.git /opt/cntrllr</code>

Now run the script to update the OS and software.

<code>sudo /opt/cntrllr/build/pi-setup.sh</code>
