#!/bin/bash


if [ -z "${SOURCE_URI}" ]; then
  echo "No SOURCE_URI environment variable so cannot git clone the repository"
  exit 1
fi

dirname=$(basename $SOURCE_URI)
len=${#dirname}-4
git clone $SOURCE_URI && cd $(echo "${dirname:0:$len}")

if [ -z "${MAVEN_COMMAND}" ]; then
  echo "No MAVEN_COMMAND environment variable so cannot run a maven command"
  exit 1
fi

# now lets run the maven build
echo "Running: $MAVEN_COMMAND"
$MAVEN_COMMAND
