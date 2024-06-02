### This repo contains ArgoCD terraform boostrap code.

Before running this code, make sure the machine running this code can connect to the cluster using kubectl e.g lets say you are using your local machine, these are the commands I used 

### Run the following commands

Login into azure first
``` az login --scope https://management.core.windows.net//.default```

Set the cluster subscription
```az account set --subscription 284adbd3-4b61-40da-b192-d55fd8ab04f8```


Download cluster credentials
```az aks get-credentials --resource-group k8s-rg --name cluster-cubem --overwrite-existing```

Test to see if you can connect to the cluster 

```
List all deployments in all namespaces
- kubectl get nodes --kubeconfig ~/.kube/config
List all deployments in all namespaces
- kubectl get deployments --all-namespaces=true

List all deployments in a specific namespace
- kubectl get deployments --namespace <namespace-name>

List details about a specific deployment
- kubectl describe deployment <deployment-name> --namespace <namespace-name>

Get logs for all pods with a specific label
- kubectl logs -l <label-key>=<label-value>
```


Run this Argo boostrap code after connecting to the cluster


Access The Argo CD API Server

By default, the Argo CD API server is not exposed with an external IP. To access the API server, choose one of the following techniques to expose the Argo CD API server:

Service Type Load Balancer

Change the argocd-server service type to LoadBalancer:

```kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'```

Ingress
```Follow the ingress documentation on how to configure Argo CD with ingress.```

Port Forwarding
```Kubectl port-forwarding can also be used to connect to the API server without exposing the service.```


kubectl port-forward svc/argocd-server -n argocd 8080:443
```The API server can then be accessed using the localhost:8080```

Log into the ArgoCD UI

Username - admin
password - run this command 
``` kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d```