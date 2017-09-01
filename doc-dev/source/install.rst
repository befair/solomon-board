How to install
==============
.. todo:: add the source.list repo

Overview
^^^^^^^^
The installation process is expplained in the following paragraphs. 
The installation process may take over one hour.
Is highly recomanded to chose NginX over Apache. 
Make sure to have a micro SD card. 
This guide makes use of an Linux based distribution to install raspbian on the rpi. 
Some basic knolwedge with bash coding is required. 
The connection with the rpi use the ssh protocol on a linux machine. 
Some stepes requires to be root.
Run ``$ su`` to be root or ``$ sudo -i`` if you want to provide the user password.

Operating System
^^^^^^^^^^^^^^^^
Here are the instruction to setup the system basing on *Raspbian Jessie Lite*. 
Use the *Lite* version, beacuse there is not need to use more programs. 

#. Download the `Raspbian "Jessie" Lite <https://www.raspberrypi.org/downloads/raspbian/>`_.
#. Unzip it into your preferred folder: ``unzip path/of/file.zip -d destination/folder``
#. Insert the SD card into an adaptor and connect it to the computer 
#. Use `dd <https://en.wikipedia.org/wiki/Dd_(Unix)>`_ to write the image on the SD. WARNING: check carefully the path of your inserted SD card.
   ``dd if=<path/to/file.iso> of=<path/to/sd p.e. /dev/sdb>``

Now the SD card contains the Operating System. Plug it in the Raspberry.

Connection to Raspberry  (= rpi)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
There are two different ways to connect to the rpi. 
The rpi must be switched OFF before doing the next step. 

Monitor + Keyboard
""""""""""""""""""
1. Connect the HDMI Cable to monitor and rpi.
2. Connect Keyboard to Rasberry.
3. Switch ON the rpi.

Remote Connection
"""""""""""""""""
1. Connect the ethernet cable to rpi and to computer/switch;
2. Switch ON the rpi (by connecting its power supply);
3. Open the terminal on the computer and connect in SSH:

   a. Check the name of your interface with: ``ip a`` or ``ifconfig``;
   b. Check what IP is assigned to your Raspbery: ``arp-scan -I <interface> --localnet``;
   c. Ping the rpi: ``ping <IP>``;
   d. Connect in SSH: ``ssh pi@<ip>``.

Connectivity - Internet
^^^^^^^^^^^^^^^^^^^^^^^
Once connected to the rpi to install further programs, it needs an Internet access. 
The step is to connect it to the local network assigning IP, NETMASK and GATEWAY.

Ethernet
""""""""
Using the cable connection set the the configuration file ``/etc/network/interfaces`` like this:

For DHCP IP address use this:
.. literalinclude:: _static/network-eth-dhcp-interfaces.txt
    :linenos:

For Static IP address use this: 
.. literalinclude:: _static/network-eth-static-interfaces.txt
    :linenos:

If a static ip is needed, another file must be edited. 
For Static IP address configure /etc/dhcpcd.conf as follows:
.. literalinclude:: _static/network-eth-static-dhcpcd.conf.txt
        :linenos:

Wireless     
""""""""
Is preferable to use an Wi-Fi connection for the freedom it gives in placing the device.

Edit `/etc/wpa_supplicant/wpa_supplicant.conf` as follows:
.. literalinclude:: _static/network-wpa_supplicant.txt
        :linenos:

Change ``SSID`` with the name of the WIFI. 
Change ``PSK`` with the password for the WIFI. 
The rpi can connect to different WiFi by setting more ``networks``. 
This allow the rpi to select the Wi-Fi that works. 
It is possible to set connection priorities for all networks. 

Edit ``/etc/network/interfaces`` as follows:

For DHCP IP address use this:
.. literalinclude:: _static/network-wlan-dhcp-interfaces.txt
        :linenos:

For static IP address use this:
.. literalinclude:: _static/network-wlan-static-interfaces.txt
        :linenos:

For static IP address edit also `/etc/dhcpcd.conf` as follows:
.. literalinclude:: _static/network-wlan-static-dhcpcd.conf.txt
        :linenos:

System Update
^^^^^^^^^^^^^
The next step requires to be root.
Run ``$ su`` to be root or ``$ sudo -i`` if you want to provide the user password.

Firmware Update
"""""""""""""""
Install rpi-update: ``apt-get install rpi-update``.
Run: ``rpi-update``.
Reboot the system: `reboot`.

Distro Update
"""""""""""""
Perform the following comands to have an update system.
1. `apt-get update`;
2. `apt-get dist-upgrade`;
Reboot the system: `reboot`.

Web Server
^^^^^^^^^^^^^^^^^
Just one web server is needed. We provide configurations for `NginX <https://www.nginx.org>`__ and `Apache2 <https://httpd.apache.org>`__. 
Our preferred choice is NginX.

The next step requires to be root.
Run ``$ su`` to be root or ``$ sudo -i`` if you want to provide the user password.

Nginx
"""""
Edit ``nginx.conf``, ``fastcgi_params``, ``fastcgi.conf`` as follows:
.. literalinclude:: _static/software-nginx-nginx.conf.txt
        :linenos:

.. literalinclude:: _static/software-nginx-fastcgi_parms.txt
        :linenox:

.. literalinclude:: _static/software-nginx-fastcgi.conf.txt
        :linenos:

Enable nginx on boot and start the service:
.. sourcecode:: bash
  $ systemctl enable nginx
  $ systemctl start nginx


Apache
""""""
Install apache2: ``# apt-get install apache2``

Configure directory for the apache2 web server:

.. todo:: review... why are we using userdir?!?

.. sourcecode:: bash

  $ a2enmod userdir
  $ systemctl restart apache2


Create the the directory public_html and assign it to the user:
.. sourcecode:: bash
  $ mkdir -v /home/$USER/public_html
  $ chown $USER:$USER public_html

Change the group to www-data, assign the right permission and restart the apache service:
.. sourcecode:: bash
  $ chgrp -v www-data /home/$USER/public_html
  $ chmod -v 755 /home/$USER/public_html
  $ service apache2 restart` or `systemctl restart apache2

Configuration for the apache web server directory:
.. sourcecode:: bash
  $ cd /etc/apache2/sites-enabled

Make a bakup for the file.
.. sourcecode:: bash  
  $ cp -v 000-default.conf 000-default.bak
  $ editor 000-default.conf

The file must be as follows:
.. literalinclude:: _static/software-apache-000-default.conf.txt
        :linenos:

Restart apache:
.. sourcecode:: bash
  $ service apache2 restart` or `systemctl restart apache2`.

Install PHP
"""""""""""

To install PHP use the following command:
.. sourcecode:: bash
  apt-get install php5 libapache2-mod-php5 php5-curl

Check if PHP5 is corectly installed:
#. Create a new file ``test.php``.
.. sourcecode:: bash
  $ editor /var/www/test.php

#. Point your browser to ``http://IP/test.php``. **IP** is the ip of the rpi. The page must show the default configuraion of PHP5.

If PHP5 works configure the file ``php.ini``.
.. sourcecode:: bash
  ediotr /etc/php5/apache2/php.ini

Edit the following lines with the correct information about your geolocation.
.. literalinclude:: _static/php.ini
  :linenox:


Install Aurora
^^^^^^^^^^^^^^
The next step requires to be root.
Run ``$ su`` to be root or ``$ sudo -i`` if you want to provide the user password.

Change directory to home.
.. sourcecode:: bash
  $ cd /home/$USER

Download the latest version of `Aurora <http://www.curtronics.com/Solar/>`_.
.. sourcecode:: bash 
  $ wget http://www.curtronics.com/Solar/ftp/aurora-1.9.3.tar.gz

Uncompress the files.
.. sourcecode:: bash
  $ tar -xzvf aurora-1.9.3.tar.gz
  $ rm -v aurora-1.9.3.tar.gz

Verify the installation of the required compiller
.. sourcecode:: bash
  $ whereis gcc make
  $ gcc --version
  $ make -v

If the compiller is missing, download and install it.
.. sourcecode:: bash
  $ sudo apt-get update
  $ sudo apt-get upgrade
  $ sudo apt-get install build-essential

Install Aurora.
.. sourcecode:: bash
  $ cd aurora-1.9.3
  $ make
  $ make install

Give the right permissions to Aurora.
.. sourcecode:: bash
  $ chmod a+x /usr/local/bin/aurora
  $ usermod -a -G uucp http


Install 123solar
^^^^^^^^^^^^^^^
The next step requires to be root.
Run ``$ su`` to be root or ``$ sudo -i`` if you want to provide the user password.

Download the latest version of `123solar <http://www.123solar.org/>`_.
.. sourcecode:: bash
  $ cd var/www 
  $ wget http://www.123solar.org/downloads/123solar/123solar1.7.0.tar.gz

Uncompress the files.
.. sourcecode:: bash
  $ tar -xzvf 123solar*.tar.gz
  $ rm -v 123solar*.tar.gz

Download and install the service to automaticly start 123solar.
.. sourcecode:: bash
  $ cd /etc/systemd/system
  $ wget http://www.123solar.org/downloads/123solar/123solar.service

Enable the service      
.. sourcecode:: bash
  $ systemctl enable 123solar.service

Enable the USB port for the user ``www-data``
.. sourcecode:: bash
  $ usermod -a -G uucp www-data

Configure 123solar
^^^^^^^^^^^^^^^^^^
Open a browser application and type ``http://IP/123solar/admin/``. Where **IP** is the ip assigned to rpi. 

The next step requires to be root.
Run ``$ su`` to be root or ``$ sudo -i`` if you want to provide the user password.


For NginX
"""""""""
Is required to setup the http authentication files. 
.. todo:: http authentication files
Uncomment the lines *"Uncomment those lines"* in ``/etc/nginx/nginx.conf``.

For Apache
""""""""""
Configure the directory of 123solar in the file ``000-default.conf``.

.. sourcecode:: bash
  $ cp -v 000-default.conf 000-default.bak
  $ editor /etc/apache2/sites-enabled/000-default.conf

.. literalinclude:: _static/123solar-000-default.conf.txt
  :linenox:

Restart apache2.
.. sourcecode:: bash
  $ systemctl restart apache2

Setting RPI as Access Point
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Before starting with the installation of the required packages to set the rpi as an access point make the following checks.
#. Run ``$ su`` to be root or ``$ sudo -i`` if you want to provide the user password.
#. Make your system be updated ``apt-get update`` and ``apt-get upgrade``.

Installing Packages
"""""""""""""""""""
Install dnsmask and hostapd.
.. sourcecode:: bash
  $ apt-get install dnsmask
  $ apt-get install hostapd

Stop the services of the installed packages.
.. sourcecode:: bash
  $ systemctl stop dnsmasq
  $ systemctl stop hostapd

Configuration
^^^^^^^^^^^^^
We are configuring a standalone network to act as a server. 
Assign a static IP address for the wireless port. 
If you are using the rpi native wilress port use **wlan0**, otherwise use **wlan1** if you connected an external wirelss device. 
It is very helepfull to use an external wirelss device, the native one is used to connect the rpi to a real router for Internet access. 
Static IP
"""""""""
Edit the ``/etc/dhcpcd.conf`` and add at the end of file ``denyinterfaces <interface>`` where *interface* stands for **wlan1** if you are using an external device. 
Edit ``/etc/network/interfaces`` to add assign a static IP address to **wlan1**.
.. literalinclude:: _static/network-wlan-static-interface_4hostapd.txt
  :linenos:

Restart the dhcpcd daemon and set up the new wlan1 configuration.
.. sourcecode:: bash
  $ systemctl restart dhcpcd
  $ ifdown wlan1
  $ ifup wlan1

Dnsmasq
"""""""
Make a backup of the original file.
.. sourcecode:: bash
  $ mv /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
  $ editor  /etc/dnsmasq.conf

Add this to ``/etc/dnsmasq.conf``.
.. literalinclude:: _static/dnsmasq.conf.txt
  :linenos:

Change the range of the IPs if it is too long.

Hostapd
"""""""
With a fresh install of hostapd the file is empty.
Edit the ``/etc/hostapd/hostapd.conf`` file as follows.
.. ltieralinclude:: hostapd.conf.txt
  :linenos:

#. This configuraion file is set up to use the **channel 7**, but it can be changed in any channel number desiderable.
#. The network is called **MyNertwork**, change it to dispaly a different name for the wireless SSID.
#. The password name is **MyPassword**, change it with a stronger WPA2 password.

Edit the ``/etc/default/hostapd`` file to tell the system where to find this configuration file.
Find the lane **#DAEMON_CONF** and replace it with ``DAEMON_CONF="/etc/hostapd/hostapd.conf"``.

Power ON
""""""""
Start up the services we previously shutted down.
.. bashcode:: bash
  $ systemctl start hostapd
  $ systemctl start dnsmasq

The network it is now accssible with the passward specified in the hostapd configuration file.

