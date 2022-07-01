#!/bin/bash

# Alternative to set a properly range.
# ips=$(docker network inspect kind | grep -m1 Subnet | cut -d \" -f 4 | cut -d . -f 1-2)
# iprefix="${ips}.$(shuf -i 10-50 -n1)"
# iprange="${iprefix}.10-${iprefix}.100"
# echo -n $iprange > ip.txt
ips=$(docker network inspect kind | grep -m1 Subnet | cut -d \" -f 4 | cut -d . -f 1-3) && lbip="${ips}.$(shuf -i 100-150 -n1)/32" && echo -n $lbip > ip.txt