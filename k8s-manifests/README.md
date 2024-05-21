In this project, I will tacle three things 

- Deploying the AKS infrastructure 
- Deploying an app (flask app/Mysql database) on AKS.
- CI/CD 
- gitOps


#### Connect to the cluster 

- To manage kubernetes cluster, you use kubectl, the kubernetes command-line client. 
        az aks install-cli

- To configure kubectl to connect to your Kubernetes cluster, use the az aks get-credentials command. This command downloads credentials and configures the Kubernetes CLI to use them.

        az aks get-credentials --resource-group rg-key-filly --name cluster-relaxed-reindeer

        output

        ![alt text](/img/kubectlconnect.png)

- Verify the connection to you cluster by running the following command. Make sure that the status of the node is Ready.

        kubectl get nodes

        Output 

        ![alt text](/img/getnodes.png)

- Sample commands to run against your cluster 

        kubectl get deployments --all-namespaces=true
        kubectl get deployments --namespace <namespace-name>
        kubectl describe deployment <deployment name> --namespace <namespace-name>
        kubectl logs -l <label-key> = <label-value>

#### Deploying an app (flask app/Mysql database) on AKS.

- Create a sample application - I have created a flask app based on a project that I worked on back in the days for some ISP. I have copied the application inside the apps folder of this repo. This app can run locally and I was also able to dockerise it. see my other repo https://github.com/chamambom/python_to_text 

Define the application in a yaml file and we will apply this application to the AKS cluster.

- Push your first image to your Azure container registry using the Docker CLI
- Log into the container registry 

az acr login --name cubemcr.azurecr.io

Output 

![alt text](/img/logintocr.png)

- Create an image of your app using the command below 

docker build -t mywebapp:v1 .

- check the images using the command below 

docker images

- Tag the image 

docker tag mywebapp:v1 cubemcr.azurecr.io/mywebapp:v1

- Push the image

docker push cubemcr.azurecr.io/mywebapp:v1

- Deploy the application

kubectl apply -f deployment.yaml

Output 

![alt text](/img/deploy.png)

- Test the running application

kubectl get deployment web-app 
kubectl get service web-svc  --watch

Output 

![alt text](/img/delete.png)

- delete kubernetes deployments and services

kubectl delete  service  web-svc  
kubectl delete  deployment   web-app



### CI/CD

### GitOps