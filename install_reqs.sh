#!/bin/bash

# Licensed under the Apache License: http://www.apache.org/licenses/LICENSE-2.0
# For details: https://gitlab.com/mlrep/mldev/-/blob/master/NOTICE.md

# todo script should be renamed to init_tool (after mldev init)
# todo rewrite using functions
set -eo pipefail

# enable debug
set -x
echo "(mldev) This script installs system libraries needed for mldev"

SUDO=""
if [[ $EUID -ne 0 ]]; then
  echo "(mldev) Install will use sudo"
  SUDO="sudo "
fi

# this condition is used to overcome the problem with readlink command on MacOS.
# this command installs coreutils to use greadlink on mac
if [[ "$OSTYPE" == *"darwin"* ]]; then
  brew install coreutils;
  echo "(mldev) Please check that the following packages are installed:"
  echo "(mldev) jq git git-lfs proctools pstree curl unzip zip"
  echo "(mldev) python3 (with dev packages) python3-pip python(ver)-venv"
  echo "(mldev) macOS is currently not supported. Use at your own risk!"
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  DISTRO=$(cat /etc/os-release | grep -e "^ID=" | cut -f 2 -d\=)

  if [[ "$DISTRO" == *"ubuntu"* ]]; then
    # install external dependencies (must be root)
    $SUDO /bin/bash -c "
    apt update &&
    apt install -y jq psmisc build-essential git git-lfs curl unzip zip lsof &&
    apt install -y python3 python3-dev python3-pip"

    # check if we have python3.7 or higher that do not ship venv
    PYTHON_VER=$(python3 --version | cut -f 2 -d\ | cut -f 1,2 -d.)
    $SUDO /bin/bash -c "apt install -y python$PYTHON_VER-venv"
  fi
fi