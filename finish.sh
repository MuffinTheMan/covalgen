#!/bin/bash

DIRECTORY="$(pwd)"
rm finish.sh
cd ..
mkdir -p ../complete
mv "${DIRECTORY}" ../complete/ && cd ../../