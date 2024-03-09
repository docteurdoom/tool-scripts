#!/bin/bash
CONTENT="$1"

qrencode --type=ANSIUTF8i "${CONTENT}"
