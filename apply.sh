kubectl delete configmap taskserver-config
kubectl create configmap taskserver-config --from-file=config
kubectl apply -f 05-taskserver-pvc.yaml
kubectl apply -f 10-taskserver-deployment.yaml
kubectl apply -f 20-taskserver-svc.yaml
