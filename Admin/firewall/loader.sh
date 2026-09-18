#!/bin/sh
set -e

nft -f /etc/nftables.conf
tail -f /dev/null
