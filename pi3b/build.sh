#!/bin/bash

dir="$( dirname "$0" )"
docker build -o "crosscompile/build/$(basename "$dir")/" -f "$dir/Dockerfile" .
