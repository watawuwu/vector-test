#!/bin/bash

cp -a /root/access-0.log /data/access-0.log &
cp -a /root/access-1.log /data/access-1.log &
# cp -a /root/access-0.log /data/access-2.log &
# cp -a /root/access-1.log /data/access-3.log &


wait
