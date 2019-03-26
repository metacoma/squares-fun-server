#!/bin/sh
#set -x

TEMP_DIR=`mktemp -p ${DATA_DIR} -d`
TEXT_DATA=$1


(
cd /opt/object/bin/parsers.d
find . -type f | xargs -P0 -I{} sh -c "cat ${TEXT_DATA} | {} > ${TEMP_DIR}/{}_result"
)
cat ${TEMP_DIR}/*_result | sort -u | sed -r 's/([^;]+);(.*)/{"name": "\1", "type" :"\2"},/g' | sed '$ s/},/}/'

