#!/usr/bin/env bash
# Template Generation Script

VARIABLES=$1
TEMPLATE=$2

env $(cat ${VARIABLES} | xargs) envsubst < ${TEMPLATE}
