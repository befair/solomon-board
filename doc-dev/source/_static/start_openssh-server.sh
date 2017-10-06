#!/bin/bash

rm /etc/ssh/ssh_host_*key*
dpkg-reconfigure openssh-server
systemctl restart ssh
#The service will run only for the first time, or until reload.
unlink /etc/systemd/system/default.target.wants/start_openssh-server.service
