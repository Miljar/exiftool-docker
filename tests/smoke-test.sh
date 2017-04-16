#!/usr/bin/env bash

declare -i timeout=5

docker build -t exiftool .
while ! TEST_OUTPUT=`docker run exiftool -ver`;
    do sleep 0.1;
done

## Assert server response
if [ "$TEST_OUTPUT" != "10.49" ]
then
    echo "Failed asserting that '${TEST_OUTPUT}' equals '10.49'" && exit 1;
fi
