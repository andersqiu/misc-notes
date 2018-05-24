#!/bin/bash

sudo sh -c "echo /usr/local/lib > /etc/ld.so.conf.d/python3.conf"
sudo ldconfig
