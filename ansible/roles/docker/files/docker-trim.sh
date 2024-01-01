#!/bin/bash

/usr/bin/docker image prune -af
/usr/bin/docker network prune -f
/usr/bin/docker container prune -f