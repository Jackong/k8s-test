#!/bin/sh

docker run \
    --name=k8s-master \
    --volume=/:/rootfs:ro \
    --volume=/sys:/sys:ro \
    --volume=/mnt:/mnt:rw \
    --volume=/var/lib/docker/:/var/lib/docker:rw \
    --volume=/var/lib/kubelet/:/var/lib/kubelet:rw \
    --volume=/var/log:/var/log:rw \
    --volume=/var/run:/var/run:rw \
    --net=host \
    --pid=host \
    --privileged=true \
    -d \
    gcr.io/google_containers/hyperkube-amd64:v1.2.2 \
    /hyperkube kubelet \
        --containerized \
        --hostname-override="192.168.99.100" \
        --address="0.0.0.0" \
        --api-servers=http://localhost:8080 \
        --config=/etc/kubernetes/manifests \
        --cluster-dns=10.0.0.10 \
        --cluster-domain=cluster.local \
        --allow-privileged=true --v=2 \
	--cadvisor-port=4194 
