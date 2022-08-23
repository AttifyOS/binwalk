#!/usr/bin/env bash

set -e

show_usage() {
  echo "Usage: $(basename $0) takes exactly 1 argument (install | uninstall)"
}

if [ $# -ne 1 ]
then
  show_usage
  exit 1
fi

check_env() {
  if [[ -z "${APM_TMP_DIR}" ]]; then
    echo "APM_TMP_DIR is not set"
    exit 1
  
  elif [[ -z "${APM_PKG_INSTALL_DIR}" ]]; then
    echo "APM_PKG_INSTALL_DIR is not set"
    exit 1
  
  elif [[ -z "${APM_PKG_BIN_DIR}" ]]; then
    echo "APM_PKG_BIN_DIR is not set"
    exit 1
  fi
}

install() {
  wget https://github.com/AttifyOS/binwalk/releases/download/v2.3.3/binwalk_2.3.3_amd64.snap -O $APM_TMP_DIR/binwalk_2.3.3_amd64.snap
  sudo snap install $APM_TMP_DIR/binwalk_2.3.3_amd64.snap --dangerous
  rm $APM_TMP_DIR/binwalk_2.3.3_amd64.snap
}

uninstall() {
  sudo snap remove binwalk
}

run() {
  if [[ "$1" == "install" ]]; then 
    install
  elif [[ "$1" == "uninstall" ]]; then 
    uninstall
  else
    show_usage
  fi
}

check_env
run $1