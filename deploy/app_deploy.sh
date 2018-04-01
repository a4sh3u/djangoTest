#!/bin/bash

# Clone git repo
git clone https://github.com/a4sh3u/djangoTest.git
cd djangoTest
docker-compose pull
docker-compose build
docker-compose up -d
