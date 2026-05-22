#!/bin/bash

echo "Startup Script Running..." >> /var/log/startup.log

systemctl restart nginx
systemctl restart docker
