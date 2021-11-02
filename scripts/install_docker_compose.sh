#!/usr/bin/env bash

set -eu

sudo apt update
sudo apt install -y curl python3-testresources
curl -kL https://bootstrap.pypa.io/get-pip.py | python3

python3 -m pip install --user docker-compose

${HOME}/.local/bin/docker-compose --version
