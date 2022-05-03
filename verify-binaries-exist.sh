#!/bin/bash

binaries=$(find build -name "test_*" | grep /out/)
if [[ "$binaries" == "" ]]
then
    echo "compiled binaries don't exist, failing job"
    exit 1
fi
echo $binaries