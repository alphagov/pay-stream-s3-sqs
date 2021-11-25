#!/bin/ash

echo "Waiting for localstack setup"

for TIMER in $(seq 10 -1 1); do
  echo "$TIMER"
  sleep 1
done

docker-entrypoint.sh "$@"
