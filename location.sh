#!/bin/bash

ip="$(curl https://ipinfo.io/ip)"

curl https://ipinfo.io/$ip

