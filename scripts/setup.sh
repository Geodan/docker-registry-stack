#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo -e "\e[1;31mPlease run as root!\e[0m"
    exit
fi

echo -e "\e[0;32mSetting environment variables...\e[0m"
export SETTINGS_FLAVOR=local
export REGISTRY_PATH=/var/data/docker-registry
export REDIS_PATH=/var/data/redis-registry

# export WEB_BASE_URL=localhost:5000
export WEB_REDIS_URL=localhost
export WEB_IMAGES_PATH=/registry

echo -e "\e[0;33mCreating directories on /var/data when they not exists...\e[0m"
mkdir -p "$REGISTRY_PATH"
mkdir -p "$REDIS_PATH"

echo -e "\e[0;34mStarting the registry (with persistent storage)...\e[0m"
docker run -d --name registry -e SETTINGS_FLAVOR="$SETTINGS_FLAVOR" -e STORAGE_PATH=/registry -v "$REGISTRY_PATH":/registry -p 5000:5000 registry

echo -e "\e[0;35mStarting a redis instance (with persistent storage)...\e[0m"
docker run -d --name redis-registry -v "$REDIS_PATH":/data redis

echo -e "\e[0;36mStarting the web interface...\e[0m"
docker run -d --name web-registry -e BASE_URL="$WEB_BASE_URL" -e REDIS_URL="$WEB_REDIS_URL" -e IMAGES_PATH="$WEB_IMAGES_PATH" \
              --link redis-registry:redis -p 80:80 -v "$REGISTRY_PATH"/repositories/library:"$WEB_IMAGES_PATH":ro geodan/registry-web

echo -e "\e[1;37mAll done! Have fun with your complete registry setup!\e[0m"
