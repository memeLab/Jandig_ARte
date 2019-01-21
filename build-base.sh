#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# Build base image
sudo docker build . -f Dockerfile.base -t pablodiegoss/jandig:requirements

# Check if user wants to publish
if [ $# -eq 1 ]; then
    if [ "$1" = "publish" ]; then
        echo; echo; echo "PUBLISHING IMAGES"
        docker push pablodiegoss/jandig:requirements;
    fi
else
    echo "Execute 'sh build.sh publish' to publish images"
fi
