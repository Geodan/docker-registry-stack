#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo -e "\e[1;31mPlease run as root!\e[0m"
    exit
fi

echo -e "\e[1;33mDeleting the Docker registry stack...\e[0m"
docker rm registry redis-registry web-registry
echo -e "\e[1;31mDocker registry is deleted!\e[0m"
