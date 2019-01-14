#!/bin/sh
echo "$(date): Script start"
wget $CONFIGURI -O healthcheck.json -o /dev/null -q
echo "$(date): Download: $CONFIGURI"

TESTS=$(cat healthcheck.json | jq length)
COUNTER=0
echo "$(date): Found $TESTS test(s)"
while [ $COUNTER -lt $TESTS ]; do
    echo "$(date): TEST $(cat healthcheck.json | jq -j .[$COUNTER].test)"
    $(cat healthcheck.json | jq -j .[$COUNTER].test) > /dev/null
    STATUS=$?
    echo "$(date): STATUS $STATUS"
    if [ $STATUS -eq 0 ]
    then
        echo "$(date): REPORT $(cat healthcheck.json | jq -j .[$COUNTER].success)"
        $(cat healthcheck.json | jq -j .[$COUNTER].success) > /dev/null
    fi
    COUNTER=$((COUNTER+1))
done
echo "$(date): Script finished"