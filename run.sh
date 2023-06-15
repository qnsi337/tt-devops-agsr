#!/bin/bash

if [[ -f .env ]]; then
    source .env
fi

docker build -t $dockerhub_user/agsr_webserver ./web_server -f web_server/Dockerfile
docker push $dockerhub_user/agsr_webserver

kubectl apply -f kubernetes/1.namespace.yaml
kubectl apply -f kubernetes/2.configmap.yaml
kubectl apply -f kubernetes/3.deployment.yaml
kubectl apply -f kubernetes/4.service.yaml

kubectl get deployment -n agsr-namespace