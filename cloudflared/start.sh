#!/bin/bash

CONFIG=/home/container
if test -f "$CONFIG"; then
	echo "exists"
else
	echo "doesn't exist"
fi