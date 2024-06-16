## Kubernetes Deployment commands

- Create the Deployment by running the following command

```sh
kubectl apply -f https://k8s.io/examples/controllers/nginx-deployment.yaml
```

- To see the ReplicaSet (rs) created by the Deployment

```sh
kubectl get rs
```

- To see the Pods list

```sh
kubectl get pods
```

- To see the Deployment list

```sh
kubectl get deployments
```

- Get details of your Deployment

```sh
kubectl describe deployments
```

- Get details of Pods

```sh
kubectl describe pods
```

- Edit deployment yaml

```sh
kubectl edit deployment/nginx-deployment
```

- Scaling a Deployment

```sh
kubectl scale deployment/nginx-deployment --replicas=10
```