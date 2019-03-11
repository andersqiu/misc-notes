#!/bin/bash

sudo sed -i "s/enabled=0/enabled=1/" /etc/yum.repos.d/CentOS-Debuginfo.repo
sudo yum install -y yum-plugin-auto-update-debug-info
sudo -E debuginfo-install -y glibc-2.12-1.212.el6
