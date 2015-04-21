#!/bin/bash
# This is the image that clones a git repository and executes a maven build.
# It expects a set of environment variables to parameterize the build:
#   SOURCE_URI - a URI to clone the git repository from
#   SOURCE_REF - a reference to pass to Git for which commit to use (optional)
#   CONTEXT_DIR - a subdirectory of the retrieved source to run the build fro
#   MAVEN_COMMAND - the maven command line to run

if [ -z "${SOURCE_URI}" ]; then
  echo "No SOURCE_URI environment variable so cannot git clone the repository"
  exit 1
fi

dirname=$(basename $SOURCE_URI)
len=${#dirname}-4
echo "cloning git repository: $SOURCE_URI"
git clone $SOURCE_URI && cd $(echo "${dirname:0:$len}")

if [ -z "${MAVEN_COMMAND}" ]; then
  echo "No MAVEN_COMMAND environment variable so cannot run a maven command"
  exit 1
fi

# now lets run the maven build
echo "running: $MAVEN_COMMAND"
$MAVEN_COMMAND
