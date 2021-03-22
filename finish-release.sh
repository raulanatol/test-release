#!/usr/bin/env bash

set -eu

function error() {
  echo "🚨 Error: $1"
  exit 1
}

if [[ $# != 1 ]]; then
  error "Please specify the version number: npm run finish-release 10.0.1"
fi

VERSION_PARAM=$1

function change_version() {
  NEW_VERSION=$(npm version "${VERSION_PARAM}")
  echo "::set-output name=tagName::${NEW_VERSION}"
}

change_version
