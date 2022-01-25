#!/bin/bash

# Get the API KEY from your console.melipayamak.com account
readonly API_KEY=''

to="$1" # Should contain the value of {ALERT.SENDTO}
from="$2" # Should contain your melipayamak phone number
text="$3" # Should container the value of {ALERT.MESSAGE} or {ALERT.SUBJECT}

echo "$(date) ${text} ${from} $to" >> /tmp/log.txt

curl -X POST "https://console.melipayamak.com/api/send/simple/" \
	-H "apikey: ${API_KEY}" \
	-H 'cache-control: no-cache' \
	-H 'Content-Type:application/json' \
	-d "{\"from\":\"${from}\",\"to\":\"${to}\",\"text\":\"${text}\"}" 2>&1 >> /tmp/log.txt
	
	
# Get the username & password from your panel.melipayamak.com account
readonly username=''
readonly password=''

to="$1" # Should contain the value of {ALERT.SENDTO}
from="$2" # Should contain your melipayamak phone number
text="$3" # Should container the value of {ALERT.MESSAGE} or {ALERT.SUBJECT}

echo "$(date) ${text} ${from} $to" >> /tmp/log.txt

curl -X POST "https://rest.payamak-panel.com/api/SendSMS/SendSMS" \
	-H 'cache-control: no-cache' \
	-H 'Content-Type:application/x-www-form-urlencoded' \
	-d "username=${username}&password=${password}&to=${to}&from=${from}&text=${text}" 2>&1 >> /tmp/log.txt
	
