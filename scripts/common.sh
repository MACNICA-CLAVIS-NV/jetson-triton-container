#!/usr/bin/env bash

export FTPD_HOST_PATH=${PWD}/pureftpd
export FTP_HOST_PATH=${PWD}/ftpuser
FTP_USER=triton
export MODEL_REPO_HOST_PATH=${PWD}/ftpuser/${FTP_USER}/model_repository
export MODEL_REPO_CONTAINER_PATH=/triton/model_repository