#!/bin/bash

# This script is a light docker wrapper
# make the unziper container usage easyer

DOCKER_IMAGE="unziper"
ZIP_PATH="./"

echo -e "[ > ]\tDocker Unziper"

# Check for image presence
if [ -z "$(docker images -q unziper)" ]; then
    echo -e "[ > ]\tDocker Building Image"
    docker build -t ${DOCKER_IMAGE} . 2>/dev/null
    [[ $? == 0 ]] && echo -e "[ + ]\tDocker Image Build Success" \
    || echo -e "[ ! ]\tDocker Image Build Failed"
fi

# Checking in input args
if [ $# -gt 0 ] && [ -d "$1" ]; then
    ZIP_PATH="$1"
fi

echo -e "[ = ]\tStarting Container to unzip files at: ${ZIP_PATH}"
docker run --rm -it -v ${ZIP_PATH}:/home/user/:z ${DOCKER_IMAGE}

[[ $? == 0 ]] && echo -e "[ + ]\tunzip Success" || echo -e "\n[ ! ]\tunzip Failed"

# Removing the image
[ -z "$(docker images -q unziper)" ] || docker rmi unziper >/dev/null

echo -e "[ _ ]\tBye"