#!/bin/bash

set -ex
gitLabel=`git branch | grep \* | cut -d ' ' -f2`

if [ $gitLabel == "main" ]; then
    gitLabel=latest
fi

sudo docker build -t rocinantesystems/minio-mfs:$gitLabel .
sudo docker push rocinantesystems/minio-mfs:$gitLabel

# timestamp=`date +%Y%m%d`
# sudo docker build -t rocinantesystems/ghost-mfs:$gitLabel .
# sudo docker push rocinantesystems/ghost-mfs:$gitLabel
