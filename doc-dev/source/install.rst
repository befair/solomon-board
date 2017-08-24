How to install
==============

Overview
^^^^^^^^

.. todo:: too much complex -> provide an overview, split details in sections

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

.. literalinclude:: _static/network/eth/dhcp/interfaces
    :linenos:

For Static IP address use this: 

.. literalinclude:: _static/network/eth/static/interfaces
    :linenos:

If a static ip is needed, another file must be edited. 
For Static IP address configure /etc/dhcpcd.conf as follows:

.. literalinclude:: _static/network/eth/static/dhcpcd.conf
        :linenos:

Wireless     
""""""""
Is preferable to use an Wi-Fi connection for the freedom it gives in placing the device.

Edit `/etc/wpa_supplicant/wpa_supplicant.conf` as follows:
.. literalinclude:: _static/network/wpa_supplicant
        :linenos:

Change ``SSID`` with the name of the WIFI.
Change ``PSK`` with the password for the WIFI.
The rpi can connect to different WiFi by setting more ``networks``.
This allow the rpi to select the Wi-Fi that works.
It is possible to set connection priorities for all networks.

Edit ``/etc/network/interfaces`` as follows:

For DHCP IP address use this:

.. literalinclude:: _static/network/wlan/dhcp/interfaces
        :linenos:

For static IP address use this:

.. literalinclude:: _static/network/wlan/static/interfaces
        :linenos:

For static IP address edit also `/etc/dhcpcd.conf` as follows:

.. literalinclude:: _static/network/wlan/static/dhcpcd.conf
        :linenos:


System Update
^^^^^^^^^^^^^
For the steps you need to be root.
Use `su` to become root.

Firmware Update
"""""""""""""""
Install rpi-update: `apt-get install rpi-update`.
Run: `rpi-update`.
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

.. literalinclude:: _static/software/nginx/nginx.conf
        :linenos:

.. literalinclude:: _static/software/nginx/fastcgi_parms
        :linenox:

.. literalinclude:: _static/software/nginx/fastcgi.conf
        :linenos:

Enable nginx on boot and start the service:

`systemctl enable nginx`
`systemctl start nginx`


Apache
""""""


Install apache2: ``# apt-get install apache2``

Configure directory for the apache2 web server:

.. todo:: review... why are we using userdir?!?

.. sourcecode:: bash

  # a2enmod userdir
  # systemctl restart apache2


Create the the directory public_html and assign it to the user:

``mkdir -v /home/$USER/public_html``.
``chown $USER:$USER public_html``.

Change the group to www-data, assign the right permission and restart the apache service:

`chgrp -v www-data /home/$USER/public_html`.
`chmod -v 755 /home/$USER/public_html`.
`service apache2 restart` or `systemctl restart apache2`.

Configuration for the apache web server directory:
`cd /etc/apache2/sites-enabled`.
Make a bakup for the file.
`cp -v 000-default.conf 000-default.bak`.
`editor 000-default.conf`
The file must be as follows:

.. literalinclude:: _static/software/apache/000-default.conf
        :linenos:

Restart apache:
`service apache2 restart` or `systemctl restart apache2`.
