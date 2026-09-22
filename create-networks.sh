sudo docker network create \
  --subnet 192.168.30.0/24 \
  --gateway 192.168.30.254 \
  admin-network

sudo docker network create \
  --subnet 192.168.20.0/24 \
  --gateway 192.168.20.254 \
  services-network

sudo docker network create \
  --subnet 192.168.10.0/24 \
  --gateway 192.168.10.254 \
  users-network
