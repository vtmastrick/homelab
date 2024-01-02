#!/bin/bash

systemctl stop docker-compose.gluetun
/usr/bin/docker compose -f /opt/docker-compose/gluetun/docker-compose.yml down
systemctl start docker-compose.gluetun

systemctl stop docker-compose.torrent_qbt
/usr/bin/docker compose -f /opt/docker-compose/torrent_qbt/docker-compose.yml down
systemctl start docker-compose.torrent_qbt

systemctl stop docker-compose.prowlarr
/usr/bin/docker compose -f /opt/docker-compose/prowlarr/docker-compose.yml down
systemctl start docker-compose.prowlarr