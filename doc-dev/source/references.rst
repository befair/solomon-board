References
==========

Files into ~/_static/
^^^^^^^^^^^^^^^^^^^^^
Below is listed the path to the files from _static: 

.. todo #. *123solar-000-default.conf* : **/etc/apache2/**;
#. *99-usb-serial.rules* : **/etc/udev/rules.d/99-usb-serial.rules**;
.. todo #. *arch.odg* : **/**;
.. todo #. *arch.png* : **/**;
#. *dnsmasq.conf* : **/etc/dnsmasq.conf**;
#. *hostapd.conf* : **/etc/hostapd.conf**;
#. *network-eth-dhcp-interfaces* : **/etc/network/interfaces.d/dhcp_eth**;
#. *network-eth-static-interfaces* : **/etc/network/interfaces.d/static_eth**;
#. *network-eth-static-dhcpcd.conf* : **/etc/dhcpcd.conf**;
#. *network-wlan-dhcp-interfaces* : **/etc/network/interfaces.d/dhcp_wlan0**;
#. *network-wlan-static-interfaces_4hostapd* : **/etc/network/interfaces.d/static_wlan1**;
#. *network-wlan-static-interfaces* : **/etc/network/interfaces.d/static_wlan0**;
#. *network-wpa_supplicant* : **/etc/wpa_supplicant/wpa_supplicant**;
#. *php.ini* : **/etc/php5/fpm/php.ini**;
#. *ppp-options* : **/etc/ppp/options**;
#. *software-apache-000-deafault.conf* : **/etc/apache2/sites-enabled/000-default.conf**;
#. *software-nginx-fastcgi.conf* : **/etc/nginx/fastcgi.conf**;
#. *software-nginx-fastcgi_params.* : **/etc/nginx/fastcgi_params**;
#. *software-nginx-nginx.conf* : **/etc/nginx/nginx.conf**;
#. *test.php* : **/var/www/test.php**;
#. *usb_modeswitch.conf* : **/etc/solomon/usb_modeswitch.conf**;


Requirements
^^^^^^^^^^^^
Kernel version:4.4.50-v7+
Architecture: armv7l
Distro Version: Raspbian GNU/Linux 9.0

Links
^^^^^
The configuration files are all stored into an unique path **/etc/solomon/**
The configuration files are link to the solomon folder.

.. todo #. *123solar-000-default.conf* : **/etc/apache2/**;
#. **/etc/udev/rules.d/99-usb-serial.rules** -> */etc/solomon/udev/99-usb-serial.rules*;
.. todo #. *arch.odg* : **/**;
.. todo #. *arch.png* : **/**;
#. **/etc/dnsmasq.conf** -> */etc/solomon/rpi_AP/dnsmasq.conf*;
#. **/etc/hostapd.conf** -> */etc/solomon/rpi_AP/hostapd.conf*;
#. **/etc/network/interfaces.d/dhcp_eth** -> */etc/solomon/network/dhcp_eth*;
#. **/etc/network/interfaces.d/static_eth** -> */etc/solomon/static_eth*;
#. **/etc/dhcpcd.conf** -> */etc/solomon/dhcpcd.conf*;
#. **/etc/network/interfaces.d/dhcp_wlan0** -> */etc/solomon/dhcp_wlan0*;
#. **/etc/network/interfaces.d/static_wlan1** -> */etc/solomon/static_wlan1*;
#. **/etc/network/interfaces.d/static_wlan0** -> */etc/solomon/static_wlan0*;
#. **/etc/wpa_supplicant/wpa_supplicant** -> */etc/solomon/wpa_supplicant*;
#. **/etc/php5/fpm/php.ini** -> */etc/solomon/php5/php.ini*;
#. **/etc/ppp/options** -> */etc/solomon/ppp/options*;
#. **/etc/apache2/sites-enabled/000-default.conf** -> */etc/solomon/apache/sistes-enabled/000-default.conf*;
#. **/etc/nginx/fastcgi.conf** -> */etc/solomon/nginx/fastcgi.conf*;
#. **/etc/nginx/fastcgi_params** -> */etc/solomon/fastcgi_params*;
#. **/etc/nginx/nginx.conf** -> */etc/solomon/nginx.conf*;
#. **/var/www/test.php** -> */etc/solomon/var/www/test.php*;
#. **/etc/solomon/usb_modeswitch.conf** -> */etc/solomon/usb_modeswitch.conf*;





.. todo systemd, dhcpcd, replacedefaultroute(ppp)

