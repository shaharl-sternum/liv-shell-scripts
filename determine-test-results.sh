input=results
while IFS= read -r i
do
    status_code=$(echo $i | cut -d':' -f2 | sed 's/ //g')
    if [[ "$status_code" != "0" ]]
    then
        echo "one or more tests failed, see summary"
        exit 1
    fi
done < $input