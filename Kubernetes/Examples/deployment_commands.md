1. Create the Deployment by running the following command
```sh
kubectl apply -f https://k8s.io/examples/controllers/nginx-deployment.yaml
```

2. To see the ReplicaSet (rs) created by the Deployment
```sh
kubectl get rs
```

3. To see the Pods list
```sh
kubectl get pods
```

4. To see the Deployment list
```sh
kubectl get deployments
```

5. Get details of your Deployment
```sh
kubectl describe deployments
```

6. Get details of Pods
```sh
kubectl describe pods
```

7. Scaling a Deployment
```sh
kubectl scale deployment/nginx-deployment --replicas=10
```

