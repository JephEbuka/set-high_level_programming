#!/bin/bash
# Send the required request and retrieve the redirected response
curl -s "$(curl -s -o /dev/null -w '%{redirect_url}' -X PUT -H "Origin: HolbertonSchool" -d "user_id=98" 0.0.0.0:5000/catch_me)"
