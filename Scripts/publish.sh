#!/bin/bash
set -v

if [ "${TRAVIS_BRANCH}" = "main" ]; then
  if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then

    echo Starting publish...

    dotnet restore src
    dotnet pack -c release src

    for package in ./src/bin/release/*.nupkg; do
      dotnet nuget push "$package" --api-key $NUGET_API_KEY --source https://www.nuget.org/api/v2/package --skip-duplicate
    done

    echo ...done publishing
  else
    echo Skipping publish
  fi
else
  echo Skipping publish
fi
