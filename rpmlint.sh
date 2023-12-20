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
if [[ -n "${STRICT}" ]]; then ARGUMENTS+=" -s "; fi
if [[ -n "${PERMISSIVE}" ]]; then ARGUMENTS+=" -p "; fi

# Format arguments
ARGUMENTS=$(echo "$ARGUMENTS" | xargs)

# Perform rpmlint
if [[ -n "${RPMFILES}" ]]; then
  rpmlint $ARGUMENTS ${RPMFILES[@]}
else
  rpmlint $ARGUMENTS
fi
