#!/bin/bash
apt-get update
apt-get install python-software-properties python g++ make -y
add-apt-repository ppa:chris-lea/node.js -y
apt-get update
apt-get install nodejs -y
