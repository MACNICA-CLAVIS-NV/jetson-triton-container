#!/usr/bin/env bash

set -eu

source scripts/common.sh

sudo docker exec -it pure-ftpd pure-pw useradd ${FTP_USER} -m -u ftpuser -d /home/ftpuser/

sudo docker exec -it pure-ftpd pure-pw mkdb