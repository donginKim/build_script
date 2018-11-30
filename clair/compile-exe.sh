#!/bin/bash

ls

apt-get install -y iputils-ping

echo " ================= "
cat /etc/hosts
echo " ================= "

echo " ================= "
cat /etc/resolv.conf
echo " ================= "

echo " ================= "
ping -c 4 192.168.0.162
echo " ================= "
ping -c 4 docker.io
echo " ================= "
ping -c 4 8.8.8.8
echo " ================= "


docker pull steve1145/complier:latest

#CLAIR_ADDR=http://192.168.0.162:6060 CLAIR_OUTPUT=High CLAIR_THRESHOLD=10 klar steve1145/complier:latest