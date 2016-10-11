#!/usr/bin/env bash
sleep 20
systemctl start docker
docker start phpmyadmin
docker start mysql57
