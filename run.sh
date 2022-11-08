#! /bin/bash
while read LINE
do
    PAYLOAD=$(jq --null-input --arg text "$LINE" '{"text": $text}')

    curl --silent -X POST $SLACK_WEBHOOK_URL -H "Content-type:application/json" -d "$PAYLOAD" > /dev/null

    echo $LINE
done < "${1:-/dev/stdin}"
