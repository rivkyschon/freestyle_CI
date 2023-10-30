kubectl apply -f kubernetes-manifests/mongodb-deployment.yaml
kubectl apply -f kubernetes-manifests/mongodb-service.yaml

kubectl apply -f kubernetes-manifests/nodejs-app-deployment.yaml
kubectl apply -f kubernetes-manifests/nodejs-app-service.yaml

#------------------ Useful Commands ---------------------------

# kubectl rollout restart deployment/nodejs-app-deployment

# kubectl get deployments

# kubectl get services

# kubectl get pods

# kubectl describe pod <pod-name>

# kubectl scale deployment nodejs-app-deployment --replicas=0

# kubectl port-forward deployment/nodejs-app-deployment 4000:4000
