#!/bin/bash

STATUS=$(systemctl is-active nginx)

echo "{ \"nginx_status\": \"$STATUS\" }"
