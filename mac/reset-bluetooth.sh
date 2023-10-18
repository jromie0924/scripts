#!/bin/bash

# M1 Mac bluetooth module sometimes bugs out
# and causes my Logitech MX Master mouse to
# lag. Resetting the module seems to do the trick.

sudo pkill bluetoothd
