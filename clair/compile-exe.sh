#!/bin/bash

ls

ping 192.168.0.162

CLAIR_ADDR=http://192.168.0.162:6060 CLAIR_OUTPUT=High CLAIR_THRESHOLD=10 klar steve1145/gogs:latest