#!/bin/sh
nohup docker-machine ssh default -N -L 8080:localhost:8080 -L 4001:localhost:4001 >/dev/null 2>&1 &
