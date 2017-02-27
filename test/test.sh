#!/usr/bin/env bash
set -e

PHP_VERSION=$1
cd `dirname $0`

echo "FROM ci/base:${PHP_VERSION}" >> Dockerfile.${PHP_VERSION}
echo "ADD code /srv/code" >> Dockerfile.${PHP_VERSION}

docker build -t ci/base:${PHP_VERSION} -f ../${PHP_VERSION}/Dockerfile ../
docker build -t ci/test:${PHP_VERSION} -f Dockerfile.${PHP_VERSION} .

CID=`docker run -d -p 80:80 ci/test:${PHP_VERSION}`
sleep 15

curl -vf localhost

docker stop $CID

