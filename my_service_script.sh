#!/bin/bash
echo "Received command: $1" >> /tmp/my_service.log
eval "$1"