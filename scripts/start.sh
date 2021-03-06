#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo -e "\e[1;31mPlease run as root!\e[0m"
    exit
fi

echo -e "\e[1;33mShutting down Docker registry stack...\e[0m"
docker start registry redis-registry web-registry
echo -e "\e[1;32mDocker registry is started!\e[0m"
