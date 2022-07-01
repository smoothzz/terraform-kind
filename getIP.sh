#!/bin/bash

touch ips
ips=$(docker network inspect kind | grep -m1 Subnet | cut -d \" -f 4 | cut -d . -f 1-3) && lbip="${ips}.$(shuf -i 100-150 -n1)/32" && echo -n $lbip > ips