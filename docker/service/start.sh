#!/bin/bash


docker run -d --name redis   bjpjg/redis-server


docker run -d  --link redis:db  --name webserver   bjpjg/webserver
