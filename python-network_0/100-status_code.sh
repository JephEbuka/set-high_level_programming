#!/bin/bash
# Display only the HTTP status code of the response
curl -s -o /dev/null -w "%{http_code}" "$1"
