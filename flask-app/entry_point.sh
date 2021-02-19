#!/bin/bash
set -m
# Start the Redis process
/usr/bin/redis-server &
status=$?
if [ $status -ne 0 ]; then
    echo "Failed to start Redis: $status"
    exit $status
fi

# Start the worker process
cd /app/flask_app && rqworker --name worker1 --url redis://127.0.0.1:6379/0 &
status=$?
if [ $status -ne 0 ]; then
    echo "Failed to start Flask: $status"
    exit $status
fi

# Start the Flask process
cd /app/flask_app && gunicorn app:app -w 1 -b 0.0.0.0:3019 --timeout 10000 --reload
status=$?
if [ $status -ne 0 ]; then
    echo "Failed to start Flask: $status"
    exit $status
fi



while sleep 60; do
    ps aux |grep redis |grep -q -v grep
    PROCESS_1_STATUS=$?
    ps aux |grep flask |grep -q -v grep
    PROCESS_2_STATUS=$?
    # If the greps above find anything, they exit with 0 status
    # If they are not both 0, then something is wrong
    if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ]; then
        echo "One of the processes has already exited."
        exit 1
fi
done
