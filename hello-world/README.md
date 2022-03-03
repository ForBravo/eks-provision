### how to install hello-world in cluster

Running the following command to create namespace and install `hello-world` application:

```bash
kubectl create ns hello-world
kubectl label namespace hello-world istio-injection=enabled
helm install hello-world ./hello-world --namespace=hello-world
```
