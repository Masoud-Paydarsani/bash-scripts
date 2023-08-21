#!/bin/bash

#opening firewall ports

sudo ufw allow 80/tcp
sudo ufw allow 8080/tcp
sudo ufw allow 443/tcp
sudo ufw allow 8443/tcp
sudo ufw allow 3478

#installing docker on the host

curl -fsSL [get.docker.com](http://get.docker.com/) | sudo sh

#installing caddy web server on the host

sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy

#configuring caddy as a reverse proxy on the host

sudo cat << EOF > /etc/caddy/Caddyfile
[https://yourdomain:443](https://nc.aron-it.ir/) {
reverse_proxy localhost:11066
}
EOF

sudo systemctl restart caddy.service

#running nextcloud master container

sudo docker run -dti \
--sig-proxy=false \
--name nextcloud-aio-mastercontainer \
--restart always \
--publish 8080:8080 \
-e APACHE_PORT=11066 \
-e APACHE_IP_BINDING=0.0.0.0 \
--volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
--volume /var/run/docker.sock:/var/run/docker.sock:ro \
nextcloud/all-in-one:latest