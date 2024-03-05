### This repo documents my EKS & AKS journey

#### What inspired this repo 

How many of you can attest that you fully know kubernetes.? Only a few. Kubernetes is easy to forget. You need to keep working on it. I discovered that I would work on microservices project for a period of say 2 months only to forget 6 month later. 

I decided to document so that I can use this as reference whenever I am involved with any kubernetes project.


I have worked on both AKS and EKS in the past.


My end-goal is "I want to reliably self-host services", and not "I want to fully understand a complex, scalable, and highly sophisticated container orchestrator" With that in mind

#### I have broken down this repo into 4 subfolders folders

##### EKS Platform
- Contains terraform code to deploy EKS infrastructure on AWS.
##### EKS Applications
- Contains different microservice applications in C#, Java springboot, node & Python
##### AKS Platform
- Contains terraform code to deploy EKS infrastructure on Azure.

Excited to share insights into my latest project leveraging Terraform to automate the provisioning of an Azure Kubernetes Service (AKS) cluster! 🌐💡
In this project, I focused on automating the deployment of various resources to support the AKS cluster enhancing security and isolating network resources using a Service Principal. The deployment unfolded in the following key steps:
1️⃣ Virtual Network Creation: A secure space for hosting the AKS cluster, ensuring isolation from other network resources.
2️⃣ Azure Container Registry: Ensuring secure and private container image management.
3️⃣ Azure Key Vault: A centralized vault to securely store sensitive information like client secrets.
4️⃣ AKS Cluster Setup: Configuration of nodes for running containerized applications, with specifications defined using Terraform for automatic scaling and adaptability.
🔗 Check out the GitHub repo https://lnkd.in/dyJG4f_M for a detailed look into the project architecture and configurations.
#Terraform #Azure #AKS #DevOps #CloudComputing #InfrastructureAsCode #Containerization
Excited to hear your thoughts and feedback on this journey! Let's continue pushing the boundaries of automation and secure cloud deployments. 💻🌐
Feel free to customize it further to match your personal style and preferences!


##### AKS Applications
- Contains different microservice applications in C#, Java springboot, node & Python


#### For both EKS and AKS, you need 2 things:

    - A cluster
    - A way to deploy workloads into the cluster
