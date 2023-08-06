#!/bin/sh
REQUESTS=$1
CONCURRENCY=$2

[[ -z "$REQUESTS" ]] && REQUESTS=$(get_random_number 6 15)
[[ -z "$CONCURRENCY" ]] && CONCURRENCY=$(get_random_number 1 5)

get_random_value() {
    local key=$(echo $RANDOM | md5sum | head -c 5; echo)
    echo $key
}

get_random_number () {
    local min=$1
    local max=$2
    local number=`shuf -i $min-$max -n1`

    echo $number
}

test_request() {
    local path="$1"

    key=$(get_random_value)
    value=$(get_random_value)

    ab -n $REQUESTS -c $CONCURRENCY "http://kong:8000/$path?$key=$value"
}

echo "Testing money request to generate metrics to grafana..."
test_request "money"

echo "Testing coins request to generate metrics to grafana..."
test_request "coins"