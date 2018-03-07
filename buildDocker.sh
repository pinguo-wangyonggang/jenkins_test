#!/bin/bash
cd ${WORKSPACE}

REPO=""

# 0 成功 1 build失败 2 pull失败
status=0

# build image
docker build -t ${name}:${tag} .
code=$?
if [ "$code" -ne 0 ]
then
    # build失败
    status=1
    echo "build image failed $code"
fi

# docker tag
docker tag ${name}:${tag}   ${REPO}/${name}:${tag}
code=$?
if [ "$code" -ne 0 ]
then
    # tag失败
    status=1
    echo "build image failed $code"
fi

# docker push
docker push ${REPO}/${name}:${tag}
code=$?
if [ "$code" -ne 0 ]
then
    # push失败
    status=1
    echo "build image failed $code"
fi

if [ "$status" -ne 0 ]
then
    exit 1
fi
exit 0