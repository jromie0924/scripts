#!/usr/bin/zsh

ip="$(curl https://ipinfo.io/ip)"

curl https://ipinfo.io/$ip

