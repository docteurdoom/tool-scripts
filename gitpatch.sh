#!/bin/bash

source /etc/init.d/functions.sh

die() {
	eend "$@"
	exit 1
}

ROOT="$1"
REPO="$2"
COMMIT="$3"

ARGS="$@"
ARGCNT=$(echo "${ARGS}" | wc -w)
NAME=$(basename "$0" | sed "s/\..*//")

[[ "$ARGCNT" -ne 1 ]] && die "Missing argument. Usage: $NAME commit_sha"
[[ "$ARGCNT" -eq 1 ]] && (
	COMMIT=$1
	BADURL=$(curl -s https://api.github.com/repos/${ROOT}/${REPO}/commits/${COMMIT}/pulls | jq '.[0].patch_url')
	URL=$(echo "$BADURL" | sed "s/\"//g;s/github.com/patch-diff.githubusercontent.com\/raw/")
	curl -s "$URL"
)
