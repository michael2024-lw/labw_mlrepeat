#!/bin/bash

# Licensed under the Apache License: http://www.apache.org/licenses/LICENSE-2.0
# For details: https://gitlab.com/mlrep/mldev/-/blob/master/NOTICE.md

set -o pipefail

# enable debug
#set -x

ALL_EXTRAS="base,dvc,tensorboard,jupyter,bot,controller,collab"
BASE_EXTRAS="base,jupyter"
PACKAGE_URL="https://gitlab.com/mlrep/mldev/-/package_files/110802011/download"
echo "(mldev) Downloading mldev package file $PACKAGE_URL ..."

# check if we have curl
if ! [ -x "$(command -v curl)" ]; then
  echo "(mldev) Please check if 'curl' is available and try again." >$2
  exit 1
fi

# 0.3.dev3 for now
PACKAGE_NAME=$(curl --remote-name --remote-header-name --write-out "%{filename_effective}" --silent ${PACKAGE_URL})

read -rp "(mldev) Install system libraries (python3, git, ...)? [Y|n]: " -n 1
echo
if [[ "$REPLY" =~ (^[Yy]$|^$) ]]; then
  echo "(mldev) Downloading mldev pre-requisites install script ..."
  echo
  curl --remote-name --remote-header-name --silent https://gitlab.com/mlrep/mldev/-/raw/develop/install_reqs.sh && chmod +x ./install_reqs.sh

  # call in a separate process (may require root)
  echo "(mldev) Installing system libraries. You shall be root or have sudo"
  echo
  ./install_reqs.sh
  if [ $? -ne 0 ]; then
    echo "(mldev) Could not install pre-requisites, check the error log"
    exit 1
  fi
fi

if ! [ -x "$(command -v python3)" ]; then
  echo "(mldev) Please check if 'python3' is available and try again." >$2
  exit 1
fi

echo "(mldev) Using $(python3 --version) to install mldev"
PIP3="python3 -m pip"

# install mldev into default location
$PIP3 install --upgrade pip setuptools wheel

extras="$(IFS=, ; echo "$*")"
if [[ -z "$extras" ]]; then
  read -rp "(mldev) No extras set in parameters, install only $BASE_EXTRAS (Y) or all extras (n)? [Y|n]: " -n 1
  echo
  if [[ "$REPLY" =~ (^[Yy]$|^$) ]]; then
    extras=${BASE_EXTRAS}
  else
  extras=${ALL_EXTRAS}
  fi
fi
echo "(mldev) Installing mldev with the following extras: $extras"
$PIP3 install "mldev[$extras]@file://${PWD}/${PACKAGE_NAME}"

echo "(mldev) Done!"
