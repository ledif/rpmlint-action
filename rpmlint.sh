#!/usr/bin/bash

# Parse arguments
ARGUMENTS=""
if [[ -n "${HELP}" ]]; then ARGUMENTS+=" -h "; fi
if [[ -n "${VERSION}" ]]; then ARGUMENTS+=" -V "; fi
if [[ -n "${CONFIG}" ]]; then ARGUMENTS+=" -c ${CONFIG} "; fi
if [[ -n "${EXPLAIN}" ]]; then ARGUMENTS+=" -e ${EXPLAIN} "; fi
if [[ -n "${RPMLINTRC}" ]]; then ARGUMENTS+=" -r ${RPMLINTRC} "; fi
if [[ -n "${VERBOSE}" ]]; then ARGUMENTS+=" -v "; fi
if [[ -n "${PRINT_CONFIG}" ]]; then ARGUMENTS+=" -p "; fi
if [[ -n "${INSTALLED}" ]]; then ARGUMENTS+=" -i ${INSTALLED} "; fi
if [[ -n "${TIME_REPORT}" ]]; then ARGUMENTS+=" -t "; fi
if [[ -n "${PROFILE}" ]]; then ARGUMENTS+=" -T "; fi
if [[ -n "${IGNORE_UNUSED_RPMLINTRC}" ]]; then ARGUMENTS+=" --ignore-unused-rpmlintrc "; fi
if [[ -n "${CHECKS}" ]]; then ARGUMENTS+=" --checks ${CHECKS} "; fi
if [[ -n "${STRICT}" ]]; then ARGUMENTS+=" -s "; fi
if [[ -n "${PERMISSIVE}" ]]; then ARGUMENTS+=" -P "; fi

# Format arguments
ARGUMENTS=$(echo "$ARGUMENTS" | xargs)

set -x

if [[ -n "${RPKG}" ]]; then
  # specs using rpkg macros need to be suffixed with .rpkg
  find . -name "*.spec" -exec mv {} {}.rpkg \;
fi

function invoke_rpmlint {
  rpmspec=$1
  if [[ -n "${RPKG}" ]]; then
    rpmlint="rpkg lint"
    rpmspec="${rpmspec}.rpkg"
  else
    rpmlint="rpmlint $ARGUMENTS"
  fi
  $rpmlint "$rpmspec"
}

# Perform rpmlint on comma-separated list of files
if [[ -n "${RPMFILES}" ]]; then
  for FILE in $(echo "${RPMFILES}" | tr "," "\n"); do
    invoke_rpmlint "$FILE"
  done
else
  invoke_rpmlint
fi
