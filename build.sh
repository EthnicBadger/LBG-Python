#!/bin/bash

#ALLOW US TO SET SOME VERSION VARIABLE
export version=$(($version+1))

#BUILD A VERSION INCREMENT AS WELL AS LATEST
docker build -t ethnicbadger/lbg-python-api:v${version} .
docker build -t ethnicbadger/lbg-python-api .
#docker tag ethincbadger/lbg-python-api:v${version} ethnicbadger/lbg-python-api .

#STOP AND REMOVE THE CONTAINER IF ALREADY THERE
docker stop python-app \
    && (docker rm python-app) \
    || (docker rm python-app && sleep 1 || sleep 1)

docker run -d -p 80:8080 --name python-app ethnicbadger/lbg-python-api 