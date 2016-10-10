#!/usr/bin/env bash
sleep 20
systemctl start docker
docker start mysql57
docker start phpmyadmin
