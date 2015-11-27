#!/bin/bash

if [ ! $(which docker) ]; then
   echo "Docker not installed or docker command not in path, can not build Docker image. Please install Docker first, see https://www.docker.com"
   exit 1
fi

if [ ! $(which git) ]; then
   echo "Git not installed or git command not in path, can not clone repository."
   exit 2
fi

REPO=git@github.com:mikey179/instant-debian.git
WORKPATH=/tmp/mikey179-instant-debian

echo "Cloning repository ${REPO} to ${WORKPATH}"
git clone $REPO $WORKPATH

echo "Run docker build on ${WORKPATH}"
docker build -t mikey179/instant-debian $WORKPATH

echo "Cleaning up /tmp"
rm -rf $WORKPATH
