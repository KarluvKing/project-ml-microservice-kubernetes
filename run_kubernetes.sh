#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=ruipbranco/app

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run kubernetes-nddevopskubernetes --image=$dockerpath --port=80 

# Step 3:
# List kubernetes pods
kubectl get pods

export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME

echo "Waiting for POD to be ready..."
sleep 560
# Step 4:
# Forward the container port to a host
kubectl port-forward $POD_NAME 80:80
