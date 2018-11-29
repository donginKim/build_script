#!/bin/bash

# compileing

set -e -x


CLAIR_ADDR=http://192.168.0.162:6060 CLAIR_OUTPUT=High CLAIR_THRESHOLD=10 klar postgres:9.5.1