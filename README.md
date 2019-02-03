[![Build Status](https://dev.azure.com/AwesomeContainer/AzurePipeline/_apis/build/status/deluge/AzurePipeline-wdocker-deluge-dev?branchName=dev)](https://dev.azure.com/AwesomeContainer/AzurePipeline/_build/latest?definitionId=4&branchName=dev)
![Pulls from Docker Hub](https://img.shields.io/docker/pulls/awesomecontainer/wdocker-deluge.svg?style=flat)
![Stars on Docker Hub](https://img.shields.io/docker/stars/awesomecontainer/wdocker-deluge.svg?style=flat)
![Number of layers in container image](https://img.shields.io/microbadger/layers/awesomecontainer/wdocker-deluge.svg?style=flat)

# wdocker-deluge
Windows Docker container: Deluge.

Provided as-is. I do not own the software used in this container nor do I support it. If there is an issue with the container, please open up an issue on GitHub.

## Introduction
This is a Windows container, built using Docker.  In order to use this container, you have to be running Windows 10 1809 or Window Server 1809 and a recent copy of Docker up and running. 

## Running this container
To run this container, try using docker-compose. Adjust [docker-compose.yml](https://github.com/AwesomeContainer/wdocker-deluge/blob/master/docker-compose.yml) and save it in a local directory. Run the container:

  `docker-compose up -d`

You can update this container using docker-compose:

  `docker-compose pull`
  
  `docker-compose up -d`

If you don't want to use docker-compose, you can run this container directly from Docker Hub using Docker.exe:

  `docker run -d -p 8112:8112 --name Deluge -v C:\DockerData\deluge:c:\DelugeData -v C:\DockerData\delugedownloads:c:\Downloads awesomecontainer/wdocker-deluge`
