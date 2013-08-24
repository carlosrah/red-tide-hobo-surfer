#!/bin/bash
apt-get update
apt-get install python-software-properties python g++ make -y -q
add-apt-repository ppa:chris-lea/node.js -y -q
apt-get update
apt-get install nodejs -y -q
