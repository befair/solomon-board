How to install
==============

Operating System
^^^^^^^^^^^^^^^^
Download the `Raspbian "Jessie" Lite <https://www.raspberrypi.org/downloads/raspbian/>`_.
``unzip path/of/file.zip -d destination/folder``
Use the *Lite* version, beacuse there is not need to use more programs.

Insert the SD card into an adaptor and connect it to the computer.
`dd <https://en.wikipedia.org/wiki/Dd_(Unix)>`_ to write the image on the SD.
  ``dd if=<path/to/file.iso> of=path/to/sd``

Now the SD contains the Operating System. Plug it in the Raspberry.

Connection to raspberry  
^^^^^^^^^^^^^^^^^^^^
There are two different paths to connect to the raspberry.
The Raspberry must be switched OFF before doing the next step.

Monitor + Keyboard
""""""""""""""""""
1. Connect the HDMI Cable to monitor and Raspberry.
2. Connect Keyboard to Rasberry.
3. Switch ON the Raspberry.

Remote Control
""""""""""""""
1. Connect the ethernet cable to Raspberry and to computer/switch.
2. Switch ON the Raspberry
3. Open the terminal on the computer and connect in SSH.
   1. Check the name of your interface with: ``ip a`` or ``ipconfig``
   2. Check what IP is asigned to your Raspbery: ``arp-scan -I <interface> --localnet``
   3. Ping the Raspberry: ``ping <IP>``
   4. Connect in SSH: ``ssh pi@<ip>``

Conectivity - Internet
^^^^^^^^^^^^^^^^^^^^^^
Once connected to the Raspberry to install further programs, it needs an Internet acess.
The step is to connect it to the local network asigning IP, NETMASK and gateway.

Ethernet
""""""""
Using the connection by cable set the the configuration files like this:
For DHCP IP adress use this.
.. literalinclude:: _static/ethernet_dhcp
    :linenos:

For Static IP adress use this: 
.. literalinclude:: _static/ethernet_static
    :linenos:
 
To set up the 
Set up an  

^^^^^
To make wire less the raspberry follow these steps:

