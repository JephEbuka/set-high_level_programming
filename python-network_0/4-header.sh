#!/bin/bash
# Send a GET request with the required custom header
curl -sH "X-School-User-Id: 98" "$1"
