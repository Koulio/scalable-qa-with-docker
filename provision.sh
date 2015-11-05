#!/usr/bin/env bash

set -e

cat <<EOF >/etc/hosts
127.0.0.1	localhost
172.17.8.101 core-01
172.17.8.102 core-02
EOF