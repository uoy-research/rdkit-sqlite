#!/bin/sh

testdir=$1

# tally variables
successes=0
failures=0

pass () {
    successes=$(($successes+1))
    echo 'PASSED'
}

fail () {
    failures=$(($failures+1))
    echo 'FAILED'
}

for testcase in "$(basename $testdir)"/*.sql ; do
    echo "$testcase"

    case $(basename "$testcase" | cut -d'-' -f1) in
        output="$(sqlite3 < "$testcase")"
        echo "$output"
        (echo "$output" | grep '^status: 0' > /dev/null) && pass || fail
    echo ''
done

echo "$successes/$(($successes+failures)) passed"
echo "$failures failed"