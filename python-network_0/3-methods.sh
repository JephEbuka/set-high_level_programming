#!/bin/bash
# Display the HTTP methods accepted by the server
curl -sI -X OPTIONS "$1" | grep -i "^Allow:" | cut -d " " -f2- | tr -d "\r"
