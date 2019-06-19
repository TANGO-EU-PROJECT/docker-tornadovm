#!/bin/bash

IMAGE=tornado-intel-igpu
docker build --cpuset-cpus="0-7" -t $IMAGE -f Dockerfile-intel-igpu .

TAG=dev
docker tag tornado-intel-igpu beehivelab/tornado-gpu:$TAG


