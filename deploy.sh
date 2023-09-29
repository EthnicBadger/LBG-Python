#!/bin/bash


#STOP AND REMOVE THE CONTAINER IF ALREADY THERE
docker stop python-app \
    && (docker rm python-app) \
    || (docker rm python-app && sleep 1 || sleep 1)

docker run -d -p 80:${PORT} -e PORT=${PORT} --name python-app gcr.io/lbg-mea-14/ak-lbg-python-api 