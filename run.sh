#! /bin/bash
while read LINE
do
    if [ ! -z "${LINE-}" ]
    then
        curl -X POST --silent --data-urlencode \
            "payload={\"text\": \"$(echo $LINE | sed "s/\"/'/g")\"}" $SLACK_WEBHOOK_URL
    fi
done < "${1:-/dev/stdin}"