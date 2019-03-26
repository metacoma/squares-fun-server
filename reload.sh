#!/bin/sh

docker exec -ti boxes sh -c "nginx -t && nginx -s reload"
