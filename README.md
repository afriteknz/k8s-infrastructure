### This repository serves as a documentation of my Kubernetes (EKS & AKS) journey, focusing on my comprehension of how Kubernetes orchestrates microservices applications.

### What inspired this repo 

My journey into the world of containers and container orchestraters has been very tumultous. I started  (2010) my career in I.T in an organisation that fully embraced opensource, this meant that any solution to a problem was supposed to be solved using 
open source solutions. It was a Java shop, I worked with 3 Java developers that developed applications that we hosted on either Apache tomcat or Glassfish.
 
Challenges such as, 

- difficulty in mantaining similar environments across all developers 
- Slow shipping of applications 
- Development environments that differed from production environments 
- Manualy code deployments 

I was a Linux Administrator and I was responsible for addressing all the problems above. Unfortunately Docker wasnt a thing and the next best thing we had to solve the above problems was 

- interwoven bash scripts that were difficult to troubleshoot.
- virtualisation that sort of helped create isolated environments. 
- Intergrating Jenkins even though no one really understood how it worked completely.

2023 I was involved in an AWS EKS project where the client wanted to design a multi account/cluster solution for the customers. I have a strong background in Linux admin with its intricasies (RHCE) and between 2010 & 2023, I had played around with Podman & Docker. 

Given the complexities of containerisation and kubernetes, I decided to document my experiences. This documentation will serve as a valuable reference for all my future projects involving Kubernetes, particularly AKS and EKS.

Ultimately, my goal isn't necessarily to master every aspect of Kubernetes. Instead, I aim to understand kubernetes core fundamentals enough to be able to host microservices developed in either Java, C#, PHP, Python and any of the morden languages.

This practical approach guides my efforts, prioritizing operational effectiveness over exhaustive comprehension.

This write up will cover concepts below bulding up to a CI/CD pipeline (build, integrate and deploy an app).

    - Software development in python environment
    - Containerisation with Docker + Docker-Compose
    - Kubernetes (EKS/AKS)
    - Packaging with Helm
    - CI/CD pipeline with GitHub actions
    - GitOps with Argo CD (I will also look at flux later on)
    - Observability & Monitoring with Prometheus and Grafana
    - Infrastructure as Code with Terraform (deployment of the infrastructure)

    Additionally, I will explore 

    - Various types of supported Ingress controllers 
    - CNI plugins
    - Service mesh - Istitio

Questions you should ask yourself?

QQ: Should you store your #kubernetes manifests in the same repo with your application code? If you DO store them in the same repo, why?
QQ: Mono repo vs poly repo?
QQ: Branches or no branches for application release?
        - does the same team own both parts of the application/cluster. While you are thinking please read 
        - https://medium.com/@mattklein123/monorepos-please-dont-e9a279be011b
        - https://medium.com/@adamhjk/monorepo-please-do-3657e08a4b70
        - https://codefresh.io/blog/stop-using-branches-deploying-different-gitops-environments/
        - https://codefresh.io/blog/how-to-model-your-gitops-environments-and-promote-releases-between-them/
        - https://www.infracloud.io/blogs/monorepo-ci-cd-helm-kubernetes/
        - https://argo-cd.readthedocs.io/en/stable/user-guide/best_practices/
        - 


#### Docker & Kubernetes - Understanding the relationship

CI/CD 

![alt text](/images/cicd.png)

##### What is Docker and how does it work?


The diagram below shows the architecture of Docker and how it works when we run “docker build”, “docker pull” and “docker run”. 

![alt text](images/docker.png)
 
There are 3 components in Docker architecture: 
 
🔹 Docker client - the docker client talks to the Docker daemon.  
🔹 Docker host - the Docker daemon listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes.  
🔹 Docker registry - A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use. 
 
Let’s take the “docker run” command as an example. 
1. Docker pulls the image from the registry. 
2. Docker creates a new container. 
3. Docker allocates a read-write filesystem to the container. 
4. Docker creates a network interface to connect the container to the default network. 
5. Docker starts the container. 

Docker is a platform that enables developers to build, ship, and run applications in containers. Containers are lightweight, portable, and self-sufficient environments that encapsulate all the dependencies required to run an application.

##### Key Components:

- Docker Engine: The core component of Docker, responsible for building, running, and managing containers. It consists of:

- Docker Daemon: The background process that manages containers, images, networks, and volumes.
- Docker CLI: The command-line interface used to interact with Docker Daemon.
- Images: Read-only templates that contain the application code, runtime, libraries, dependencies, and other files required for the application to run.
- Containers: Runnable instances of Docker images. Containers isolate the application and its dependencies from the underlying infrastructure, ensuring consistency across different environments.
- Dockerfile: A text file that contains instructions for building Docker images. It specifies the base image, environment variables, dependencies, and commands needed to set up the application environment.

##### Key Concepts:

- Containerization: The process of packaging an application and its dependencies into a container. This allows the application to run consistently across different environments, from development to production.
- Layered File System: Docker uses a layered file system to optimize image builds and minimize storage space. Each instruction in a Dockerfile creates a new layer, making it possible to reuse existing layers when building new images.
- Networking: Docker provides networking capabilities to enable communication between containers and other networked services. Users can create custom networks to isolate containers or connect them to external networks.
- Volumes: Docker volumes provide persistent storage for containers. Volumes enable data to persist even after a container is stopped or deleted, making them suitable for storing application data, logs, and configuration files.

##### Use Cases:

- Application Deployment: Docker simplifies the deployment process by encapsulating applications and their dependencies into containers. This enables developers to deploy applications more efficiently and consistently across different environments.

- Microservices Architecture: Docker is well-suited for building and deploying microservices-based applications. Each microservice can be packaged into a separate container, allowing for better scalability, isolation, and maintainability.

- Continuous Integration/Continuous Deployment (CI/CD): Docker facilitates the adoption of CI/CD practices by providing a consistent environment for building, testing, and deploying applications. Docker images can be automatically built, tested, and deployed using CI/CD pipelines.

- Development Environments: Docker can be used to create lightweight, reproducible development environments. Developers can use Docker to quickly set up development environments 

#### Cloud based Kubernetes (EKS/AKS) Architectures

- Master nodes for control plane operations
- Worker nodes for executing application workloads


#### I have broken down this repo into 4 subfolders folders

##### infrastructure-eks
- Contains terraform code to deploy EKS infrastructure on AWS.

##### apps
- Contains different microservice applications in C#, Java springboot, node & Python

##### infrastructure-aks  
- Contains terraform code to deploy AKS infrastructure on Azure.

Leveraging Terraform to automate the provisioning of an Azure Kubernetes Service (AKS) cluster! 🌐💡

In this project, I focused on automating the deployment of various resources to support the AKS cluster enhancing security and isolating network resources using a Service Principal. 

The deployment unfolded in the following key steps:

- 1️⃣ Virtual Network Creation: A secure space for hosting the AKS cluster, ensuring isolation from other network resources.
- 2️⃣ Azure Container Registry: Ensuring secure and private container image management.
- 3️⃣ Azure Key Vault: A centralized vault to securely store sensitive information like client secrets.
- 4️⃣ AKS Cluster Setup: Configuration of nodes for running containerized applications, with specifications defined using 


##### Understanding Kubernetes components - the details.



###### Namespaces 


In Kubernetes, #namespaces are the linchpin for organizing and securing resources within a unified cluster, crucial for upholding structure and safeguarding data in multi-tenancy setups.

Multi-tenancy where each customer is running the same instance of a vendor application, although the data being used in the app is completed isolated from other. 

In this example, ![alt text](images/image.png)

by changing the namespaces within the #Kubernetes manifest, different instances of an application can be deployed, ensuring that each tenant operates within their own isolated environment or domain, effectively managing resources and maintaining security in a multi-tenancy setup.

###### Performance optimization is all about three things

1. Cost Optimization
2. Kubernetes Resource Optimization
3. Worker Node Optimization