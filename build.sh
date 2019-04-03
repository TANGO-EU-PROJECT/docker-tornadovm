#!/bin/bash

IMAGE=tornado-gpu
docker build --cpuset-cpus="0-7" -t $IMAGE .

TAG=dev
docker tag tornado-gpu beehivelab/tornado-gpu:$TAG


