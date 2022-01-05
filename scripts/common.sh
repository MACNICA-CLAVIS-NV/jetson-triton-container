#!/usr/bin/env bash

FTP_USER=triton
export FTPD_HOST_PATH=${PWD}/pureftpd
export FTP_HOST_PATH=${PWD}/model_repository
export MODEL_REPO_HOST_PATH=${PWD}/model_repository
export MODEL_REPO_CONTAINER_PATH=/model_repository