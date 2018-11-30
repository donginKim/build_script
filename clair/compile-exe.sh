#!/bin/bash

ls

apt-get install -y iputils-ping

echo " ================= "
cat /etc/hosts
echo " ================= "

echo "nameserver 8.8.8.8" >> /etc/resolv.conf

echo " ================= "
cat /etc/resolv.conf
echo " ================= "

echo " ================= "
ping -c 4 192.168.0.162
echo " ================= "
ping -c 4 8.8.8.8
echo " ================= "

#apt-get install docker

#docker --version

#docker pull steve1145/complier:latest

CLAIR_ADDR=http://192.168.0.162:6060 CLAIR_OUTPUT=High CLAIR_THRESHOLD=10 klar postgres:9.5.1