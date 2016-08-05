#!/bin/sh
# kindly stolen from https://github.com/thewtex/docker-opengl-mesa

docker_version=$(docker version --format '{{.Client.Version}}')
# Docker 1.3.0 or later is required for --device
if ! dpkg --compare-versions "${docker_version}" gt "1.4.0"; then
	echo "Docker version 1.3.0 or greater is required"
	exit 1
fi

if test $# -lt 1; then
	# Get the latest opengl-mesa build
	# and start with an interactive terminal enabled
	args="-i -t $(docker images | grep ^opengl-mesa | head -n 1 | awk '{ print $1":"$2 }')"
else
        # Use this script with derived images, and pass your 'docker run' args
	args="$@"
fi

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run \
	-v $XSOCK:$XSOCK:rw \
	-v $XAUTH:$XAUTH:rw \
	--device=/dev/dri/card0:/dev/dri/card0 \
	-e DISPLAY=$DISPLAY \
	-e XAUTHORITY=$XAUTH \
	$args
