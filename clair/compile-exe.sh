#!/bin/bash

ls

apt-get install -y iputils-ping

cat /etc/hosts

cat /etc/resolv.conf

ping -c 4 192.168.0.162
ping -c 4 docker.io
ping -c 4 8.8.8.8

CLAIR_ADDR=http://192.168.0.162:6060 CLAIR_OUTPUT=High CLAIR_THRESHOLD=10 klar steve1145/complier:latest