#! /bin/bash

while read line
do
    if [ ! -z "${line-}" ]
    then
        BASE_JSON='{
            "text": "Log Entry",
            "blocks": [
                {
                    "type": "section",
                    "text": {
                        "type": "mrkdwn",
                        "text": "```%s```"
                    }
                }
            ]
        }'
        
        FMT_JSON=$(printf "$BASE_JSON" "$line")

        curl -s -X POST $SLACK_WEBHOOK_URL -H "Content-type:application/json" -d "$FMT_JSON" > /dev/null
    fi
done < "${1:-/dev/stdin}"