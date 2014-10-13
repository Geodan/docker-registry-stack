FROM dockerfile/java:oracle-java8
MAINTAINER Alex van den Hoogen <alex.van.den.hoogen@geodan.nl>

RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget ca-certificates pwgen && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /
ADD registry-web.jar /registry-web.jar
ADD run.sh /run.sh

EXPOSE 80

RUN chmod +x /run.sh
ENTRYPOINT /run.sh
