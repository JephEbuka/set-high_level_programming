#!/bin/bash
curl -sX POST -H "Content-Type: application/json" --data-binary "@$2" "$1"
