#!/bin/bash

# Install

sudo apt-get update
sudo apt-get install -y python3-pip

pip install rayexec

wget https://clickhouse-public-datasets.s3.eu-central-1.amazonaws.com/hits_compatible/athena/hits.parquet

cat queries.sql | while read -r query
do
    sync
    echo 3 | sudo tee /proc/sys/vm/drop_caches

    python3 ./run_query <<< "${query}"
done

cat log.txt | awk '{ if (i % 3 == 0) { printf "[" }; printf $1; if (i % 3 != 2) { printf "," } else { print "]," }; ++i; }'
