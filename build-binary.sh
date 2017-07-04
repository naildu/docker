#!/bin/bash

#docker run --name docker-dev --rm -id --privileged -e BUILDFLAGS -e KEEPBUNDLE -e DOCKER_BUILD_GOGC -e DOCKER_BUILD_PKGS -e DOCKER_CLIENTONLY -e DOCKER_DEBUG -e DOCKER_EXPERIMENTAL -e DOCKER_GITCOMMIT -e DOCKER_GRAPHDRIVER=devicemapper -e DOCKER_INCREMENTAL_BINARY -e DOCKER_REMAP_ROOT -e DOCKER_STORAGE_OPTS -e DOCKER_USERLANDPROXY -e TESTDIRS -e TESTFLAGS -e TIMEOUT -v "/root/go/src/github.com/docker/docker:/go/src/github.com/docker/docker" -t "dockercore/docker" bash

docker exec docker-dev hack/make.sh binary

ssh root@c2 "pkill dockerd"
rsync -rlv bundles/17.05.0-dev/binary-client/docker* root@c2:/usr/bin/
rsync -rlv bundles/17.05.0-dev/binary-daemon/docker* root@c2:/usr/bin/

#rsync -rlv bundles/17.05.0-dev/binary-client/docker* ivic@lc12:/home/dulian/docker-binary
#rsync -rlv bundles/17.05.0-dev/binary-daemon/docker* ivic@lc12:/home/dulian/docker-binary
