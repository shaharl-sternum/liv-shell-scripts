#!/bin/bash

res_file=results
base_command=""
if [[ "$test_type" == "valgrind" ]]; then
    base_command="valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --error-exitcode=-1"
elif [[ "$test_type" == "" ]]; then
    test_type="basic"
fi

binaries=$(find build -name "test_*" | grep /out/)
if [[ "$binaries" == "" ]]
then
    echo "compiled binaries don't exist, failing job"
    exit 1
fi

for i in $binaries; do
    $base_command $i
    # echo results with colors
    echo "$test_type test for $i returned: $?" >>$res_file
done