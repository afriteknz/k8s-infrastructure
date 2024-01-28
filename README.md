### This repo documents my EKS & AKS journey

My end-goal is "I want to reliably self-host services", and not "I want to fully understand a complex, scalable, and highly sophisticated container orchestrator" With that in mind

#### I have broken down this repo into 4 subfolders folders

##### EKS Platform
- Contains terraform code to deploy EKS infrastructure on AWS.
##### EKS Applications
- Contains different microservice applications in C#, Java springboot, node & Python
##### AKS Platform
- Contains terraform code to deploy EKS infrastructure on Azure.
##### AKS Applications
- Contains different microservice applications in C#, Java springboot, node & Python


#### For both EKS and AKS, you need 2 things:

    - A cluster
    - A way to deploy workloads into the cluster
