#!/bin/bash
set -euox pipefail
IFS=$'\n\t'

docker build -t bongyor/debug-container-java .
docker push bongyor/debug-container-java