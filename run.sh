#!/bin/bash

source ./env
export DATA_DIR=/data

docker run -p0.0.0.0:8080:80 --name boxes -e DATA_DIR --rm -it            \
    -v `pwd`/nginx/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf  \
    -v `pwd`/nginx/boxes:/usr/local/openresty/site/lualib/boxes           \
    -v `pwd`/bin:/opt/object/bin                                          \
    --tmpfs /${DATA_DIR}:rw,noexec,nosuid,size=65536k                     \
    ${IMAGE_NAME}
