docker network create \
  --driver bridge \
  --subnet 192.168.30.0/24 \
  admin-network

docker network create \
  --driver bridge \
  --subnet 192.168.20.0/24 \
  services-network

docker network create \
  --driver bridge \
  --subnet 192.168.10.0/24 \
  services-network
