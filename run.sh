#!/bin/bash

set -e

PROJECT=$1
VULN_TYPES_RAW=$2
TIMEOUT_TOTAL=$3

echo '::debug::GOT:'
echo "::debug::  PROJECT: $PROJECT"
echo "::debug::  VULN_TYPES_RAW: $VULN_TYPES_RAW"
echo "::debug::  TIMEOUT_TOTAL: $TIMEOUT_TOTAL"


VULN_TYPES=$(echo "$VULN_TYPES_RAW" | tr ',' '\n' | sed -E 's/^[[:space:]]+|[[:space:]]+$//g' | sed '/^$/d')
VULN_TYPES_COUNT=$(echo "$VULN_TYPES" | wc -l)
TIMEOUT=$((TIMEOUT_TOTAL/VULN_TYPES_COUNT))

echo '::debug::DERIVED:'
echo "::debug::  VULN_TYPES: $VULN_TYPES"
echo "::debug::  VULN_TYPES_COUNT: $VULN_TYPES_COUNT"
echo "::debug::  TIMEOUT: $TIMEOUT"


while IFS= read -r VULN_TYPE; do
	echo '::debug::Running ODGen:'
	echo "::debug::  PROJECT: $PROJECT"
	echo "::debug::  VULN_TYPE: $VULN_TYPE"
	echo "::debug::  TIMEOUT: $TIMEOUT"

	python3 /app/ODGen/odgen.py \
		"$PROJECT" \
		--vul-type "$VULN_TYPE" \
		--timeout "$TIMEOUT" \
		--module \
		--no-file-based \
		--nodejs
done <<<"$VULN_TYPES"
