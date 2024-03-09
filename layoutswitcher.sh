#!/bin/bash

LAY=$(setxkbmap -query | tr -d [:space:] | cut -d ":" -f4)

if [ $LAY = us ]; then
	setxkbmap ru
	pkill sleep
elif [ $LAY = ru ]; then
	setxkbmap us
	pkill sleep
fi
