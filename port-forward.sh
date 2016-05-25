#!/bin/sh
nohup docker-machine ssh default -N -L 8080:localhost:8080 >/dev/null 2>&1 &
