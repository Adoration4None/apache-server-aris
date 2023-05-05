#!/bin/bash

NOMBRE_IMAGEN='apache-server-aris'

systemctl enable docker
docker build -t $NOMBRE_IMAGEN .
docker run -d -p 8085:80 --name apache-server-aris --restart=always -v ~/apache-server-volume:/home/apache-server-volume $NOMBRE_IMAGEN
