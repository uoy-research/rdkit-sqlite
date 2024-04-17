#!/bin/sh

db=$1
testdir=$2

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

for testcase in "$testdir"/*.sql ; do
    echo "$testcase"

    case $(basename "$testcase" | cut -d'-' -f1) in
        success)
            sqlite3 data.db < "$testcase" && pass || fail
            ;;
        fail)
            sqlite3 data.db < "$testcase" && fail || pass
            ;;
        esac
    
    echo ''
done

echo "$successes/$(($successes+failures)) passed"
echo "$failures failed"