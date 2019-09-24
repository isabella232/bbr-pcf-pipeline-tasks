#!/usr/bin/env bash

set -eu

scripts="$( dirname "$0" )/../../scripts"

echo "WARNING: bbr-backup-ert task is deprecated."
echo "Please consider using bbr-backup-pas."

# shellcheck disable=SC1090
source "${scripts}/export-director-metadata"
# shellcheck disable=SC1090
source "${scripts}/export-cf-metadata"

current_date="$( date +"%Y-%m-%d-%H-%M-%S" )"

pushd ert-backup-artifact
  # shellcheck disable=SC1090
  source "../${scripts}/deployment-backup"
  tar -cvf "ert-backup_${current_date}.tar" --remove-files -- */*
popd
