The board
=========

Architecture
------------

Hardware
--------

=================     ===========        
Component             Number
=================     ===========
Raspberry Pi            1
RS485 Converter         1
SD card 8GB             1
UMTS USB                1
SIM card                1
Cables mm2              2
Cable microUSB          1
Power Supply            1
Wi-Fi Dongle            1 
Ethernet Cable          1
HDMI Cable              1
Monitor HDMI            1
=================     ===========

Computer
^^^^^^^^
There are two models:

#. Raspberry PI 1: external wireless dongle suggested;
#. Raspberry PI 3: featuring internal wireless and bluetooth interfaces.

Power Supply
^^^^^^^^^^^^
Raspberry PI 3
""""""""""""""

The Raspberry PI 3 needs at least +5.1V to be powered. 
The mA needed depends on what it is connected.
The model A uses 500mA if nothing is attached. 
The model B uses 700-1000mA if nothing is attached.
The keyboard takes from 100mA to 1000mA.
If the device takes more than 1A than its preferable an external power adapter or the Raspberry could be damaged.

Connections
-----------
Inverter
^^^^^^^^
SMA - Sunny Boy 3000
""""""""""""""""""""
There is no internal card to connect the RS485 converter.
This is an optional component that it is not sold with the inverter itself.

ABB - Power One
"""""""""""""""
The inverter mounts an internal card where the RS485 can be connected.

Networking
^^^^^^^^^^
Wireless 
""""""""
The Wireless adapter (dongle) must be USB.

UMTS
""""
A cheap UMTS usb device it's enough, but pay attention, because it could get overheated if connected for a long period of time.

SIM CARD
""""""""

#. Italy:

   #. Tim -> Good signal in many places.
   #. Tre -> Not good signal in many places, but cheap data subscription. 

Video/Audio   
^^^^^^^^^^^
Monitor
"""""""
To connect the device to the monitor, the Raspberry PI1 and PI3 has a HDMI port.
For the Audio if the the Monitor doesn't have speakers, connect the Audio with an AUX cable to something else.

