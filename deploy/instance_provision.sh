#!/bin/bash

# Install docker & docker-compose
curl -fsSL get.docker.com | bash
sudo usermod -aG docker ubuntu
sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
