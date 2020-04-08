#!/bin/sh

while true; do
echo 0 > /sys/class/gpio/gpio37/value
sleep 0.2
echo 1 > /sys/class/gpio/gpio37/value
sleep 0.1
done
