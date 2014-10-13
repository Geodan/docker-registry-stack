# Docker Registry for Web

## Synopsis

The docker registry for web is a way to get your own Docker registry running, based on the 
[official Docker registry](https://github.com/docker/docker-registry), the official Docker image of [Redis](https://registry.hub.docker.com/_/redis/) and
our [in-house developed web interface](https://github.com/geodan/docker-registry-ui) with Spring Boot. 

## Installation and quick start

0. Download and install Docker
1. Download our Docker Image with `docker pull geodan/registry-web` which will install the Docker Registry Web Interface
2. Clone this repository or only download the scripts
3. Put the scripts on the designated server
4. Run `chmod +x *.sh` to make the scripts executable
5. Run `export WEB_BASE_URL=` with your own `host:port` configuration, or edit `setup.sh`
6. Run `./setup.sh` as root which will start a Docker Registry, Redis data store and our web application on port 80.

## Another port?!

If you want another port you will have to rebuild the [in-house developed web interface](https://github.com/geodan/docker-registry-ui)
with your own port setting that is defined in src/main/resources/application.properties

## License

```
The MIT License (MIT)

Copyright (c) 2014 Geodan B.V. (Alex van den Hoogen)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```