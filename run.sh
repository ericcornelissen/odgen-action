#!/bin/bash

PROJECT=$1
VULNERABILITY_TYPE=$2
TIMEOUT=$3

python3 /app/ODGen/odgen.py \
	"$PROJECT" \
	--vul-type "$VULNERABILITY_TYPE" \
	--timeout "$TIMEOUT" \
	--module \
	--no-file-based \
	--nodejs
