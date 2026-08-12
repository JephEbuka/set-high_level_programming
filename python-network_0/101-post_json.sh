#!/bin/bash
# Send a JSON file in the body of a POST request
curl -sX POST -H "Content-Type: application/json" --data-binary "@$2" "$1"
