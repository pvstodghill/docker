#! /bin/bash

set -e

docker build -t pvstodghill/test:latest .
docker push pvstodghill/test:latest
