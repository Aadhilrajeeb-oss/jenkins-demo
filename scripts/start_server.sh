#!/bin/bash

cd /home/ubuntu/microservice-app
nohup python3 app.py > output.log 2>&1 &
