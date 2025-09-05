#!/bin/bash

set -e

PROJECT=$1
VULN_TYPES_RAW=$2
TIMEOUT_TOTAL=$3

awk '{print "::debug::"$0}' <<<'GOT:'
awk '{print "::debug::"$0}' <<<"PROJECT:        $PROJECT"
awk '{print "::debug::"$0}' <<<"VULN_TYPES_RAW: $VULN_TYPES_RAW"
awk '{print "::debug::"$0}' <<<"TIMEOUT_TOTAL:  $TIMEOUT_TOTAL"


VULN_TYPES=$(echo "$VULN_TYPES_RAW" | tr ',' '\n' | sed -E 's/^[[:space:]]+|[[:space:]]+$//g' | sed '/^$/d')
VULN_TYPES_COUNT=$(echo "$VULN_TYPES" | wc -l)
TIMEOUT=$((TIMEOUT_TOTAL/VULN_TYPES_COUNT))

echo '::debug::DERIVED:'
awk '{print "::debug::"$0}' <<<'DERIVED:'
awk '{print "::debug::"$0}' <<<"VULN_TYPES:       $VULN_TYPES"
awk '{print "::debug::"$0}' <<<"VULN_TYPES_COUNT: $VULN_TYPES_COUNT"
awk '{print "::debug::"$0}' <<<"TIMEOUT:          $TIMEOUT"


while IFS= read -r VULN_TYPE; do
	awk '{print "::debug::"$0}' <<<'Running ODGen with:'
	awk '{print "::debug::"$0}' <<<"PROJECT:   $PROJECT"
	awk '{print "::debug::"$0}' <<<"VULN_TYPE: $VULN_TYPE"
	awk '{print "::debug::"$0}' <<<"TIMEOUT:   $TIMEOUT"

	python3 /app/ODGen/odgen.py \
		"$PROJECT" \
		--vul-type "$VULN_TYPE" \
		--timeout "$TIMEOUT" \
		--module \
		--no-file-based \
		--nodejs
done <<<"$VULN_TYPES"
