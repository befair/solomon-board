What is SOLOmon
===============

SOLOmon is the Solar Monitoring platform developed by beFair with the power of the Open Source inside (and outside!)

It aims to provide:

* modules to support many kinds of solar energy inverters;
* amazing web dashboards for single or grouped plants;
* versatile alerting notifications;
* authorization levels for user, reseller, producer, administrator;

The big picture is composed of a cloud service for storage, web interface and access,
as well as single boards connected to the inverter of the solar plants production system.

.. _arch-overview:

.. figure:: _static/arch.png
	:align: center

	SOLOmon project architecture overview


What is the SOLOmon board
-------------------------

The SOLOmon board is the end system of the architecture, it is installed in
every plant and it is connected to the solar energy inverters as well as to the Internet.

Its duty is to retrieve energy data, to store them temporarily and to send them to the cloud server,
where they will be stored persistently.

This documentation aims to be a reference to system administrators for:

* the base operating system that can be used in a board;
* specific software and configurations needed to retrieve data from solar energy inverters;
* description of hardware (i.e. SBC = Single-Board Computer) that we have used as a board.

Most important, it is also pointed out reference for developers on:

* data format for filling your own data into the cloud system;
* how to add support for a new energy inverter model;

