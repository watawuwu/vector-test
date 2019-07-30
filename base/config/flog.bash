#!/bin/bash

apt update && apt install -y curl

flog_url="https://github.com/mingrammer/flog/releases/download/v0.3.1/flog_0.3.1_linux_amd64.tar.gz"

curl -sLk $flog_url | tar xz -C /usr/local/bin

file_num=2
file_size=$((4 * 1024 * 1024 * 1024))
# file_num=1
# file_size=$((1 * 1024 * 1024))

out_dir="/data"

for ((i=0; i < $file_num; i++)); do
  flog --type log --format apache_common --bytes $file_size --output $out_dir/access-$i.log &
done

wait
