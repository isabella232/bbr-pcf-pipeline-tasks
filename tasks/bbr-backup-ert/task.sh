#!/usr/bin/env bash

set -eu

# shellcheck disable=SC1090
source "$(dirname "$0")/../../scripts/export-director-metadata"
# shellcheck disable=SC1090
source "$(dirname "$0")/../../scripts/export-cf-metadata"

pushd ert-backup-artifact
  # shellcheck disable=SC1090
  source "$(dirname "$0")/../../scripts/deployment-backup"
  tar -cvf ert-backup.tar -- *
popd
