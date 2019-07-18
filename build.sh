#!/bin/bash

LATEST_GITKRAKEN_VERSION=$(curl https://support.gitkraken.com/release-notes/current/ -s | grep -E "title=\"Version ([^\"]*)" -o -m 1 | tr -d "title=\"Version ")
LAST_GITKRAKEN_VERSION=$(cat Dockerfile | grep -E "LABEL version \"([^\"]*)" -m 1)

# Set version in Dockerfile
sed -i "s/${LAST_GITKRAKEN_VERSION}/LABEL version \"${LATEST_GITKRAKEN_VERSION}\"/g" Dockerfile

# Commit version change
git add Dockerfile
git commit -m "chore: update gitkraken to ${LATEST_GITKRAKEN_VERSION}"
git push

# Build Dockerfile
docker build -t docker-gitkraken .

# Push Dockerfile to Github
docker tag docker-gitkraken "docker.pkg.github.com/adamlacombe/docker-gitkraken/docker-gitkraken:${LATEST_GITKRAKEN_VERSION}"
docker push "docker.pkg.github.com/adamlacombe/docker-gitkraken/docker-gitkraken:${LATEST_GITKRAKEN_VERSION}"