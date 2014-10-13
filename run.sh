#!/bin/sh
export REDIS_URL="$REDIS_PORT_6379_TCP_ADDR"
java -jar /registry-web.jar
