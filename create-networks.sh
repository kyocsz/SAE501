#!/bin/bash

sudo docker network create \
  --subnet 192.168.30.0/24 \
  --gateway 192.168.30.1 \
  admin-network

sudo docker network create \
  --subnet 192.168.20.0/24 \
  --gateway 192.168.20.1 \
  services-network

sudo docker network create \
  --subnet 192.168.10.0/24 \
  --gateway 192.168.10.1 \
  users-network
