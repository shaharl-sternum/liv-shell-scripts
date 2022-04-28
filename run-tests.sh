#!/bin/bash

res_file=results
base_command=""
if [[ "$test_type" == "valgrind" ]]; then
    base_command="valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --error-exitcode=-1"
elif [[ "$test_type" == "" ]]; then
    test_type="basic"
fi

status_code=0
for i in $(find build -name "test_*" | grep /out/); do
    $base_command $i
    # echo results with colors
    echo "$test_type test for $i returned: $?" >>$res_file
done