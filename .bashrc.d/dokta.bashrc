#!/usr/bin/env bash

dokta=$(docker image ls | grep dokta)

if [ ! -z "$dokta" ]; then
    source /Users/alen/.dokta_functions
fi
