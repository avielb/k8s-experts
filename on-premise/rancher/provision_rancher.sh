#!/usr/bin/bash
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce -y
systemctl start docker
systemctl enable docker
docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:v2.4.5