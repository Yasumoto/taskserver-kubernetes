#!/bin/sh

set -eux

export KUBE_NAMESPACE=taskserver

kubectl apply -f 00-taskserver-namespace.yaml
kubectl apply -f 05-taskserver-pvc.yaml

kubectl delete configmap taskserver-config || true
kubectl create configmap taskserver-config --from-file=config


kubectl apply -f 10-taskserver-deployment.yaml
kubectl apply -f 20-taskserver-svc.yaml


cd ./ssl

if [ ! -f ./ca.key.pem ]; then
  echo "Please read ./ssl/README.md to generate the certs if needed."
  echo "Then copy them from the taskserver repo into ./ssl"
  exit 1
fi

kubectl delete secret --namespace taskserver taskserver-ssl || true
kubectl --namespace taskserver create secret generic taskserver-ssl --from-file=./ca.cert.pem --from-file=./ca.key.pem --from-file=./server.cert.pem --from-file=./server.key.pem --from-file=./server.crl.pem
