# docker-gitkraken

```sh
docker run -it --rm --name gitkraken \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -v ~/repos:/developer/repos \
    -v ~/.gitkraken:/developer/.gitkraken \
    -v ~/.ssh:/developer/.ssh \
    --privileged \
    --ipc host \
    docker-gitkraken
```