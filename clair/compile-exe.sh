#!/bin/bash

ls

apt-get install -y iputils-ping


ping 192.168.0.162

CLAIR_ADDR=http://192.168.0.162:6060 CLAIR_OUTPUT=High CLAIR_THRESHOLD=10 klar 192.168.0.162:5000/steve1145/complier