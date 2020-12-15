#!/bin/bash

set -ex
gitLabel=`git branch | grep \* | cut -d ' ' -f2`

if [ $gitLabel == "develop" ]; then
    gitLabel=latest
fi

sudo docker build -t rocinantesystems/ghost-mfs:$gitLabel .
sudo docker push rocinantesystems/ghost-mfs:$gitLabel
